import 'package:flutter/material.dart';


class AppTheme {
  AppTheme._();

  static getApplicationTheme({required bool isDarkMode}) {
    return ThemeData(
      // Base Theme Settings
      primaryColor: const Color(0xFFE31837), // Automotive red
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Nunito",
      colorScheme: isDarkMode
          ? const ColorScheme.dark(
              primary: Color(0xFFE31837),
              secondary: Color(0xFF2C3E50),
            )
          : const ColorScheme.light(
              primary: Color(0xFFE31837),
              secondary: Color(0xFF2C3E50),
            ),
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      useMaterial3: true,

      // App Bar Theme
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Color(0xFFE31837),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: "Nunito",
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE31837),
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: "Nunito",
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 0,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(),
        labelStyle: TextStyle(
          fontSize: 20,
          fontFamily: "Nunito",
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFE31837),
          ),
        ),
      ),

      // Progress Indicator Theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xFFE31837),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFFE31837),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}
