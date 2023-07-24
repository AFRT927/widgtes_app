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
  final bool isLightMode;

  AppTheme({
    this.selectedColor = 0,
    this.isLightMode = true
  }) : assert( selectedColor >= 0 && selectedColor <= (colorList.length - 1),'selectedColor must be within 0 and ${(colorList.length - 1)}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    
    brightness: isLightMode ? Brightness.light : Brightness.dark,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    )
  );

  AppTheme copyWith({
    int? selectedColor,
    bool? isLightMode
  }) {

    return AppTheme(selectedColor: selectedColor ?? this.selectedColor, isLightMode: isLightMode ?? this.isLightMode);
  }

}