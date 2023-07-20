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



class AppTutorialScreen extends StatelessWidget {

  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
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
            ))
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