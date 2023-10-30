import 'package:flutter/material.dart';

class klabsTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0C356A),
      brightness: Brightness.light,
      primary: const Color(0xFF0C356A),
      secondary: const Color(0xFFFFC436),
    ),
    useMaterial3: true,
  );
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark, seedColor: const Color(0xFF0C356A)),
    useMaterial3: true,
  );
}
