import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xFFFDFDFD),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFFFDFDFD),
        foregroundColor: Color(0xFF19191B),
        elevation: 0,
      ),
      textTheme: TextTheme(
        // headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 24,
          color: Color(0xff19191b),
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 24,
          color: Color(0xff19191b),
          fontWeight: FontWeight.w600,
        ),
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
      chipTheme: ChipThemeData(
        showCheckmark: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
            side: BorderSide(color: Colors.transparent)),
        selectedColor: Color(0xFFD45555),
        labelStyle: TextStyle(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 131, 131, 131),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFFDFDFD),
        selectedItemColor: Color(0xFFD45555),
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(size: 28),
        unselectedIconTheme: IconThemeData(size: 24),
      ),
      navigationBarTheme: NavigationBarThemeData(shadowColor: const Color(0xFFD5D5D5)),
      cardTheme: CardThemeData(
        color: Color(0xFFF2F2F2),
        shadowColor: Color(0xFFF2F2F2),
        elevation: 0,
      ));

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xFF0F0F12),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF0F0F12),
        foregroundColor: Colors.white70,
        elevation: 0,
      ),
      textTheme: TextTheme(
        // headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
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
      chipTheme: ChipThemeData(
        showCheckmark: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
            side: BorderSide(color: Colors.transparent)),
        selectedColor: Color(0xFFD45555),
        labelStyle: TextStyle(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 35, 35, 35),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF14141C),
        selectedItemColor: Color(0xFFD45555),
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(size: 28),
        unselectedIconTheme: IconThemeData(size: 24),
      ),
      navigationBarTheme: NavigationBarThemeData(shadowColor: const Color(0xFF1F1F2A)),
      cardTheme: CardThemeData(
        color: Color(0xFF1E1E28),
        shadowColor: Color(0xFF1E1E28),
        elevation: 0,
      ));
}
