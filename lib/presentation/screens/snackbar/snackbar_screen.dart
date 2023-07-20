import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  void openDialog(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('lorem eim teger weis rep pos gronen tier rout fomment muchmein dor lar perfi sosla ver ti opiler minto fojla rop ajum meg umerec pure mukiste topri main goetsa rewmi grumer uidek gontopri kon gilli repertus cumcusit flumerto topminski'),
        actions: [
          TextButton(
            onPressed: () => context.pop(), 
            child: const Text('Cancelar')
            ),
          FilledButton(
            onPressed: () => context.pop(), 
            child: const Text('Aceptar')
            )
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Center(
                      child: Text('App para demostrar el funcionamiento de los diferentes Widgets')
                      )
                  ]
                  );
              }, 
              child: const Text('Licencias Usadas')),

            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar dialogo de pantalla'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context), 
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('mostrar snackbar')),
    );
  }
}