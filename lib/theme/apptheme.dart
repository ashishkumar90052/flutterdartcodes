import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme(ColorScheme? lightColorScheme) {
    ColorScheme scheme = lightColorScheme ??
        ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 40, 144, 73));
    return ThemeData(useMaterial3: true, colorScheme: scheme);
  }

  static ThemeData darkTheme(ColorScheme? darkColorScheme) {
    ColorScheme scheme = darkColorScheme ??
        ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 40, 144, 73),
            brightness: Brightness.dark);
    return ThemeData(useMaterial3: true, colorScheme: scheme);
  }
}
