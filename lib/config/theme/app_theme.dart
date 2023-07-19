import 'package:flutter/material.dart';

const colorList = <Color> [
  Colors.blue,
  Colors.teal,
  Colors.red,
  Colors.purple,
  Colors.orange,
  Colors.pink
];


class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }) : assert( selectedColor >= 0 && selectedColor <= (colorList.length - 1),'selectedColor must be within 0 and ${(colorList.length - 1)}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    )
  );

}