
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final themeProvider = StateProvider<bool>((ref) => true);

// Listado de colores inmutable
/**
 * este provider es inmutable por que se definio
 * con la palabra "final". Pero en todos los luhgares
 * donde se haga uso de la palabra "ref", voy a poder
 * acceder a este "colorListProvider"
 */
final colorListProvider = Provider((ref) => colorList);