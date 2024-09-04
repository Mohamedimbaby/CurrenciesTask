import 'package:currencies_converter/core/theming/data/models/colors.dart';
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryColor, // Primary color for the app in dark mode
  primaryColorLight: Colors.blueGrey[600], // Lighter shade of the primary color
  primaryColorDark: Colors.black, // Darker shade of the primary color
  scaffoldBackgroundColor: Colors.black, // Background color for Scaffold in dark mode
  cardColor: Colors.grey[800], // Background color for Cards
  dividerColor: Colors.grey[700], // Color for dividers
  colorScheme: ColorScheme.fromSwatch(
    accentColor: Colors.cyanAccent, // Accent color for widgets like FAB, TextField
    backgroundColor: Colors.grey[900],
    errorColor:  Colors.redAccent,
    brightness: Brightness.dark
  ),//// Color used for errors (e.g., in form fields)
  appBarTheme: AppBarTheme(
    color: Colors.blueGrey[900], // Background color of the AppBar in dark mode
    elevation: 4.0, // Elevation of the AppBar
    iconTheme: const IconThemeData(color: Colors.white), // Color of icons in AppBar
    titleTextStyle:
    const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,

    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blueGrey[800], // Button background color in dark mode
    textTheme: ButtonTextTheme.primary, // Text color in buttons
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.cyanAccent, // FAB background color
    foregroundColor: Colors.black, // FAB icon/text color
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[900], // Background color of Bottom Navigation Bar
    selectedItemColor: Colors.cyanAccent, // Color of the selected item
    unselectedItemColor: Colors.grey, // Color of the unselected items
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 96.0, fontWeight: FontWeight.bold, color: Colors.white),
    displayMedium: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.white),
    displaySmall: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineLarge: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
    bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white), // Regular body text
    bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white), // Smaller body text
    bodySmall: TextStyle(fontSize: 12.0, color: Colors.white), // Smaller body text
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[800],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide.none,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white, // Default color for icons in dark mode
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: Colors.cyanAccent, // Color of the active slider track
    inactiveTrackColor: Colors.grey[700], // Color of the inactive slider track
    thumbColor: Colors.cyanAccent, // Color of the slider thumb
    overlayColor: Colors.cyanAccent.withOpacity(0.2), // Color of the slider overlay when active
  ),
);
