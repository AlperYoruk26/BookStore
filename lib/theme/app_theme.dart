import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 253, 253, 253),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFFFDFDFD),
      foregroundColor: Color(0xFF19191B),
      elevation: 0,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black54),
    ),
    colorScheme: ColorScheme.light(
      primary: Color(0xFFD45555),
      secondary: Color(0xFF19191B),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      brightness: Brightness.light,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.grey, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Color(0xFFD45555), width: 2.0),
      ),
      labelStyle: const TextStyle(fontSize: 16, color: Colors.grey),
      suffixIconColor: Colors.grey,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.symmetric(vertical: 17, horizontal: 69),
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        // fixedSize: Size(200, 55)
      ),
    ),
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF000000),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF19191B),
      foregroundColor: Colors.white70,
      elevation: 0,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white70),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
    ),
    colorScheme: ColorScheme.light(
      primary: Color(0xFFD45555),
      secondary: Color(0xFF19191B),
      onPrimary: Colors.white70,
      onSecondary: Colors.white70,
      brightness: Brightness.dark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white54, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Color(0xFFD45555), width: 2.0),
      ),
      labelStyle: const TextStyle(fontSize: 16, color: Colors.white70),
      suffixIconColor: Colors.white70,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.symmetric(vertical: 17, horizontal: 69),
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        // fixedSize: Size(200, 55)
      ),
    ),
  );
}
