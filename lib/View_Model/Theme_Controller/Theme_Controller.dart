// import 'package:flutter/material.dart';

// final lightTheme = ThemeData(
//   brightness: Brightness.light,
//   primaryColor: Colors.white, // Set primary color for light theme
//   colorScheme: ColorScheme.light(
//     primary: const Color.fromARGB(198, 201, 184, 184),
//     secondary: Colors.white70, // Secondary color
//   ),
//   appBarTheme: AppBarTheme(color: Colors.blue),
// );

// final darkTheme = ThemeData(
//   brightness: Brightness.dark,
//   primaryColor: Colors.black, // Set primary color for dark theme
//   colorScheme: ColorScheme.dark(
//     primary: const Color.fromARGB(12, 255, 255, 255),
//     secondary: Colors.white, // Secondary color
//   ),
//   appBarTheme: AppBarTheme(color: Colors.blueGrey),
// );

import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  cardColor: Colors.white54,
  brightness: Brightness.light,
  primaryColor: Colors.white, // Primary app color in light mode
  scaffoldBackgroundColor: Color(0xFFF5F5F5), // Light background color
  colorScheme: ColorScheme.light(
    primary: Color.fromARGB(198, 201, 184, 184), // Main theme color
    secondary: Colors.white70,
    surface:
        const Color.fromARGB(166, 230, 224, 224), // Card and other surfaces
    background: Color.fromARGB(179, 187, 173, 173), // General background
    error: Colors.red,
    onPrimary: Colors.black, // Text color on primary color
    onSecondary: Colors.black, // Text color on secondary color
    onSurface: Colors.black, // Text color on surfaces
    onBackground: Colors.black, // Text color on background
    onError: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    color: Color.fromARGB(198, 201, 184, 184), // Background color of AppBar
    titleTextStyle: TextStyle(color: Colors.black), // AppBar text color
    iconTheme: IconThemeData(color: Colors.black), // AppBar icon color
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black87),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color.fromARGB(198, 201, 184, 184), // Button background color
    textTheme: ButtonTextTheme.primary,
  ),
);
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  cardColor: Color.fromARGB(12, 255, 255, 255),
  primaryColor: Colors.black, // Set primary color for dark theme
  scaffoldBackgroundColor: Color.fromARGB(104, 92, 88, 88), // Dark background
  colorScheme: ColorScheme.dark(
    primary: Color.fromARGB(12, 255, 255, 255),
    secondary: Colors.white54,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.blueGrey,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blueGrey, // Button background color
    textTheme: ButtonTextTheme.primary,
  ),
);
