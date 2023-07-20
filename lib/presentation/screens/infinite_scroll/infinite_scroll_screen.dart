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

  void add5Images(){
    
    if (!isMounted) return;

    setState(() {
      isLoading = true;
      final newImagesIds = List.generate(5, (i) => i + imagesIds.last + 1);
      imagesIds.addAll(newImagesIds);      
    });  
    
  }

  // simular una tarea asincrona
  Future loadNextPage() async {
    if(isLoading == true) return;
    await Future.delayed(Duration(seconds: 1));
    add5Images();
  }

  @override
  void initState() {    
    super.initState();

    infiniteScrollController.addListener(() {
      
      if(infiniteScrollController.position.pixels == infiniteScrollController.position.maxScrollExtent){
        print("llega al final");   
        isLoading = false;     
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
          child: ListView.builder(          
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
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          child: const Icon(Icons.arrow_back),
          ),
    );
  }
}