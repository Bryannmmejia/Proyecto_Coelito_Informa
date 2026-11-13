import 'package:flutter/material.dart';

/// Colores y estilo visual compartidos por toda la aplicación.
class AppTheme {
  static const azulMarino = Color(0xFF102A43);
  static const azulCoe = Color(0xFF0875B9);
  static const azulClaro = Color(0xFFEAF5FC);

  static final claro = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFF6F9FC),
    colorScheme: ColorScheme.fromSeed(
      seedColor: azulCoe,
      primary: azulCoe,
      secondary: const Color(0xFF4AA8D8),
      surface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF6F9FC),
      foregroundColor: azulMarino,
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: azulClaro,
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
