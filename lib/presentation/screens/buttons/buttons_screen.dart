import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonScreen extends StatelessWidget {

  static const String name = 'button_screen';

  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Screen'),
      ),
      body: _Buttons_view(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.pop();
        },
        child: const Icon(
          Icons.arrow_back_rounded
        ),
        ),
    );
  }
}

class _Buttons_view extends StatelessWidget {
  const _Buttons_view();

  @override
  Widget build(BuildContext context) {
    
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Wrap(
          spacing: 10,          
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('Elevated Button')),
            const ElevatedButton(onPressed: null, child: Text('Elevated Disable')),
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.access_alarm_rounded), label: const Text('Elevated Icon')),
            FilledButton(onPressed: (){}, child: const Text('Fill Butoon')),
            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.access_time_outlined), label: const Text('Filled Icon')),
            OutlinedButton(onPressed: (){}, child: const Text('Outline Button')),
            OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.terminal), label: const Text('Outline Icon')),
            TextButton(onPressed: (){}, child: const Text('Text Button')),
            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.accessible_forward_rounded), label: const Text('Text Icon')),
            IconButton(onPressed: (){}, icon: const Icon(Icons.add_chart_sharp)),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.add_chart_sharp), 
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white)
                ),),
            const _CustomButton()

          ],
        ),
      ),
    );
  }
}


class _CustomButton extends StatelessWidget {
  const _CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola Mundo',
              style: TextStyle(
                color: Colors.white
              ),
              )
            ),
        ),
      ),
    );
  }
}