import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: Colors.deepPurple, // Primary color for the app
    scaffoldBackgroundColor: const Color.fromARGB(255, 248, 224, 255), // Background color of the scaffold
    fontFamily: 'Lato Bold', // Custom font for the app
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 243, 147, 252), // Set the AppBar color
      titleTextStyle: TextStyle(
        color: Colors.white, // Title text color
        fontSize: 20, // Title font size
        fontWeight: FontWeight.bold, // Title font weight
        fontFamily: 'Lato Bold', // Font for the AppBar title
      ),
      elevation: 0, // Optional: Set elevation for AppBar
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 236, 121, 247), // Background color of the Bottom Navigation Bar
      selectedItemColor: Colors.deepPurple, // Color for selected item
      unselectedItemColor: Colors.grey, // Color for unselected items
      showUnselectedLabels: true, // Show unselected item labels
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold, // Selected label style
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 18,
          color: Colors.white, 
          fontWeight: FontWeight.bold,
          fontFamily: 'Lato Regular',
        ),
        backgroundColor: const Color.fromARGB(255, 236, 121, 247), // Button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // Rounded corners for buttons
        ),
      ),
    ),
  );
}
