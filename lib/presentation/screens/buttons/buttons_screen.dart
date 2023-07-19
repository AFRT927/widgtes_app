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
            ElevatedButton(onPressed: (){}, child: Text('Elevated Button')),
            ElevatedButton(onPressed: null, child: Text('Elevated Disable')),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.access_alarm_rounded), label: Text('Elevated Icon')),
            FilledButton(onPressed: (){}, child: Text('Fill Butoon')),
            FilledButton.icon(onPressed: (){}, icon: Icon(Icons.access_time_outlined), label: Text('Filled Icon')),
            OutlinedButton(onPressed: (){}, child: Text('Outline Button')),
            OutlinedButton.icon(onPressed: (){}, icon: Icon(Icons.terminal), label: Text('Outline Icon')),
            TextButton(onPressed: (){}, child: Text('Text Button')),
            TextButton.icon(onPressed: (){}, icon: Icon(Icons.accessible_forward_rounded), label: Text('Text Icon')),
            IconButton(onPressed: (){}, icon: Icon(Icons.add_chart_sharp)),
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.add_chart_sharp), 
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: MaterialStatePropertyAll(Colors.white)
                ),),

          ],
        ),
      ),
    );
  }
}