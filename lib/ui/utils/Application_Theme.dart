import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static bool isDark = true;
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF004182),
    colorScheme: ColorScheme.fromSeed(
        primary: Color(0xFF004182),
        seedColor: Color(0xFF004182),
        onSecondary: Colors.white,
        onPrimary: Color(0xFF004182),
        onBackground: Color(0xFFF8F8F8),
        onPrimaryContainer: Color(0xFF004182).withOpacity(0.9)),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF004182),
      selectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 32,
      ),
      selectedItemColor: Colors.white,
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 32,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        color: Color(0xFF004182),
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 25,
        color: Color(0xFF06004F),
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
