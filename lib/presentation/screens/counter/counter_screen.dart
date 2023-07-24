import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';

// // sSE UTILIZA STATEFULL SOLO SI NO SE VAN A USAR GESTORES DE ESTADO
// class CounterScreen extends StatefulWidget {

//   static const name = 'counter_screen';
//   const CounterScreen({super.key});

//   @override
//   State<CounterScreen> createState() => _CounterScreenState();
// }

// class _CounterScreenState extends State<CounterScreen> {

//   int counter = 0;
//   @override
//   Widget build(BuildContext context) {
   
//     final colors = Theme.of(context).colorScheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Counter Screen using RiverPod'),        
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//         child: Center(
//           child: Text('Valor: $counter'),
//         ),
//         ),
//       floatingActionButton: IconButton(
//         color: colors.primary,
//         onPressed: (){
//           setState(() {
//             counter++;
//           });
//         }, 
//         icon: const Icon(Icons.add))
//     );
//   }
// }

class CounterScreen extends ConsumerWidget {

  static const name = 'counter_screen';
  const CounterScreen({super.key});
  
  final int counter = 0;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // el watch esta pendiente de los cambios del provider
    final int clickCounter = ref.watch( counterProvider );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter using ReiverPod'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Center(child: 
        Text(
          'Valor: $clickCounter',
          style: Theme.of(context).textTheme.titleLarge,
          ),),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          
        },
        child: const Icon(Icons.add),        
        ),
    );
  }
}