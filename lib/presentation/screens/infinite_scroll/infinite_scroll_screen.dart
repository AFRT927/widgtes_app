import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1, 2, 3, 4, 5];

  ScrollController infiniteScrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  void moveScrollToBottom(){
    print('entra al move scroll to bottom');
    if(infiniteScrollController.position.pixels + 200 <= infiniteScrollController.position.maxScrollExtent) return;
    print('XXXXXXXXXXXXXX intenta animar XXXXXXXXXXXXXXXX');
    infiniteScrollController.animateTo(
    infiniteScrollController.position.pixels + 120, 
    duration: const Duration(milliseconds: 300), 
    curve: Curves.fastOutSlowIn
    );
  }

  void add5Images(){
    
    if (!isMounted) return;
    setState(() {     
      isLoading = true;   
      final newImagesIds = List.generate(5, (i) => i + imagesIds.last + 1);
      imagesIds.addAll(newImagesIds);          
    });  

    moveScrollToBottom();    
  }

  // simular una tarea asincrona
  Future loadNextPage() async {
    if(isLoading == true) return;
    add5Images();
    await Future.delayed( const Duration(seconds: 2) );  

    if (!isMounted) return;
    setState(() {
      isLoading = false;
    });    
  }


  Future<void> onRefresh() async {

    await Future.delayed(const Duration(seconds: 3));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId +1);
    loadNextPage();
  }

  @override
  void initState() {    
    super.initState();

    infiniteScrollController.addListener(() {
      isLoading = false;   
      if(infiniteScrollController.position.pixels == infiniteScrollController.position.maxScrollExtent){               
        loadNextPage();
      }
      
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    infiniteScrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: Stack(
            children: [

              RefreshIndicator(
                onRefresh: () {
                  return onRefresh();
                },
                child: ListView.builder(     
                  physics: const BouncingScrollPhysics(),     
                  controller: infiniteScrollController,
                  itemCount: imagesIds.length,
                  itemBuilder: (context, index) {
                return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                  image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300')
                  );
                          },
                          ),
              ),
            ],
          ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          child: const Icon(Icons.arrow_back),
          ),
    );
  }
}