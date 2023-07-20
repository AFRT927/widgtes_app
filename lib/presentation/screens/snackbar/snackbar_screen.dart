import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';
  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'ok', onPressed: (){}),
      duration: const Duration(seconds: 2),
      );
      
    ScaffoldMessenger.of(context).showSnackBar( snackbar );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context), 
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('mostrar snackbar')),
    );
  }
}