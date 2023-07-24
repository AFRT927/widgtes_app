import 'package:flutter/material.dart';

const colorList = <Color> [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,  
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent
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