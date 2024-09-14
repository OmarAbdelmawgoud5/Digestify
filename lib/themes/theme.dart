import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  
  brightness: Brightness.light,
  
  colorScheme: const ColorScheme.light(
    surface:Colors.white ,
    secondary: Colors.red
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Colors.black,
    secondary: Colors.white,
  )
);
