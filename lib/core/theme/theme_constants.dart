import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xff02542D),
      colorScheme: const ColorScheme.light(
        error: Color(0xffF03232),
        shadow: Color(0xffD9D9D9),
        primary: Color(0xff02542D),
        secondary: Colors.black,
        outline: Color(0xffD9D9D9),
        surface: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Color(0xff333333),
      ),
      scaffoldBackgroundColor: const Color(0xffF5F5F5),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff02542D),
        foregroundColor: Colors.white,
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff02542D),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: const Color(0xff03A062),
      colorScheme: const ColorScheme.dark(
        error: Color(0xffFF6B6B),
        shadow: Color(0xffD9D9D9),
        primary: Color(0xff03A062),
        secondary: Colors.white,
        outline: Color(0xff4A4A4A),
        surface: Color(0xff1E1E1E),
        onPrimary: Colors.white,
        onSecondary: Color(0xff121212),
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xff121212),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff03A062),
        foregroundColor: Colors.white,
      ),
      cardTheme: CardTheme(
        color: const Color(0xff1E1E1E),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff03A062),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
