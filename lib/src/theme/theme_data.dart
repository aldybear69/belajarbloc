import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
  ),
  brightness: Brightness.light,
);

ThemeData darkTheme = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.black,
  ),
  brightness: Brightness.dark,
);
