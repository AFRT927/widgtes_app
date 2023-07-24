import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';


void main() {
  runApp(

    /**
     * provider scope es un tipo de widget especial el cual 
     * va a mantener una referencia a todos los providers
     * que se esten utilizando en la aplicacion.
     */
    const ProviderScope(
      child: MainApp()
      )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     
    //final bool istLight =  ref.watch(themeProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      title: 'Flutter Widgets App',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),
    );
  }
}
