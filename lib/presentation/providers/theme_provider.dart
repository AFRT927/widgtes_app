
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';



// Listado de colores inmutable
/**
 * este provider es inmutable por que se definio
 * con la palabra "final". Pero en todos los luhgares
 * donde se haga uso de la palabra "ref", voy a poder
 * acceder a este "colorListProvider".
 * 
 * Ojo: el provider es para prooveer valores inmutables
 */
final colorListProvider = Provider((ref) => colorList);


// el StateProvider es para proveer alguna pieza de estado
final themeProvider = StateProvider<bool>((ref) => true);

final selectedColorProvider = StateProvider<int>((ref) => 0);


// un objeto de tipo AppTheme (custom)
/**
 * El StateNotofoerProvider, es para mantener una pieza de estado
 * pero en objetos mas elaborados
 */
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
  );

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier(): super( AppTheme() );

  void toggleDarkMode() {
    state = state.copyWith( isLightMode: !state.isLightMode );
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith( selectedColor: colorIndex );
  }

}