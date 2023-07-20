import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}


final slides = <SlideInfo> [
  SlideInfo('Busca la comida', 'Busca la comida a traves de nuestra app', 'assets/images/1.png'),
  SlideInfo('Entrega rapida', 'accelera la entrega de tu pedido usando nuestras opciones VIP', 'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Buen provecho', 'assets/images/3.png'),
];



class AppTutorialScreen extends StatefulWidget {

  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  late final PageController pageViewController = PageController();
  
  bool showButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageViewController.addListener(() {
       
       final page = pageViewController. page ?? 0;
       if( !showButton && page > slides.length - 1.5) {
         setState(() {          
           showButton = true;
         });
       }
    });
  }

  @override
  void dispose() {
    
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            onPageChanged: (value) {

            },
            physics: const BouncingScrollPhysics(),
            children: [
              ...slides.map((s) => _Slide(title: s.title, caption: s.caption, imageUrl: s.imageUrl)),
            ],
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(              
              onPressed: (){
                context.pop();
              }, 
              child: const Text('Salir')
            )),

          showButton ? 
            Positioned(  
              right: 20,    
              bottom: 50,        
              child: FadeInRight(
                from: 15,
                delay: const Duration(milliseconds: 400),                               
                child: FilledButton(
                  onPressed: () => context.pop, 
                  child: const Text('Comenzar')),
              ),
              )

            :
            const SizedBox(), 


        ],
      ),
    );
  }
}


class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;
  const _Slide({super.key, required this.title, required this.caption, required this.imageUrl});

  

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20,),
            Text(
              title,
              style: titleStyle,
              ),
            const SizedBox(height: 10,),
            Text(
              caption,
              style: captionStyle,
              )
          ],
        )
      ),
    );
  }
}