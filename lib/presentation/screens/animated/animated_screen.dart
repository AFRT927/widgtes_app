import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

class AnimatedScreen extends StatefulWidget {

  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius =10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.bounceOut,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius)
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            width = Random().nextInt(300) * 1.0 + 50;
            height = Random().nextInt(300) * 1.0 + 50;
            color = Color.fromARGB(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));
            borderRadius = Random().nextInt(100) * 1.0 + 10;
          });
        },
        child: const Icon(Icons.play_arrow_rounded),
        ),
    );
  }
}