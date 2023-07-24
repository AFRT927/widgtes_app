import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bool isLigthMode = ref.watch( themeNotifierProvider ).isLightMode;
    final ThemeData theme = Theme.of(context);
    

    
    return Scaffold(      
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(            
            icon: Icon( isLigthMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: (){
              
              ref.read( themeNotifierProvider.notifier ).toggleDarkMode();  
              //ref.read(themeNotifierProvider.notifier).updateShouldNotify(old, current);
                    
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
    final int selectedColor = ref.watch(selectedColorProvider);    

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
          groupValue: selectedColor, 
          onChanged: (value) {            
             ref.read(selectedColorProvider.notifier).state = i;
          },);
      },
      );
  }
}