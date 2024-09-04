import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.grey.shade700, // Primary color for the app
  primaryColorLight: Colors.white, // Lighter shade of the primary color
  primaryColorDark: Colors.blue[700], // Darker shade of the primary color
  scaffoldBackgroundColor: Colors.white, // Background color for Scaffold
  cardColor: Colors.white, // Background color for Cards
  dividerColor: Colors.grey[300], // Color for dividers
  colorScheme: ColorScheme.fromSwatch(
    accentColor: Colors.orangeAccent, // Accent color for widgets like FAB, TextField
    backgroundColor: Colors.white,
    errorColor:  Colors.redAccent,
    brightness: Brightness.light
  ),// Color used for errors (e.g., in form fields)
  appBarTheme: const AppBarTheme(
    color: Colors.white, // Background color of the AppBar
    shadowColor: Colors.white,
    surfaceTintColor: Colors.white,
    iconTheme: IconThemeData(color:Colors.grey), // Color of icons in AppBar
    titleTextStyle:
       TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue, // Button background color
    textTheme: ButtonTextTheme.primary, // Text color in buttons
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.orangeAccent, // FAB background color
    foregroundColor: Colors.white, // FAB icon/text color
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white, // Background color of Bottom Navigation Bar
    selectedItemColor: Colors.blue, // Color of the selected item
    unselectedItemColor: Colors.grey, // Color of the unselected items
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 96.0, fontWeight: FontWeight.bold, color: Colors.black),
    displayMedium: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.black),
    displaySmall: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineLarge: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
    bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black), // Regular body text
    bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black), // Smaller body text
    bodySmall: TextStyle(fontSize: 12.0, color: Colors.black), // Smaller body text
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[200],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide.none,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white, // Default color for icons
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: Colors.blue, // Color of the active slider track
    inactiveTrackColor: Colors.white, // Color of the inactive slider track
    thumbColor: Colors.blue, // Color of the slider thumb
    overlayColor: Colors.white, // Color of the slider overlay when active
  ),
);
