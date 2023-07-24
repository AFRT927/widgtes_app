import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool isLigth = ref.watch( themeProvider );
    final ThemeData theme = Theme.of(context);
    

    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(            
            icon: Icon( isLigth ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
            onPressed: (){
              
              ref.read( themeProvider.notifier ).update((state) => !state);  
                    
            },
            )
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colors = ref.watch(colorListProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, i) {    
        final Color color = colors[i];    
        return RadioListTile(
          title: Text(
            'Este Color',
            style: TextStyle(
              color: color
            ),
            ),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: i, 
          groupValue: 0, 
          onChanged: (value) {
            // todo: notificar el cambio
          },);
      },
      );
  }
}