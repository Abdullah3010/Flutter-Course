import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColorsLight.primaryColor,
    secondary: AppColorsLight.secondaryColor,
    surface: AppColorsLight.surfaceColor,
    background: AppColorsLight.backgroundColor,
    error: AppColorsLight.errorColor,
    onPrimary: AppColorsLight.onPrimaryColor,
    onSecondary: AppColorsLight.onSecondaryColor,
    onSurface: AppColorsLight.onSurfaceColor,
    onBackground: AppColorsLight.onBackgroundColor,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppColorsLight.primaryColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppColorsLight.primaryColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppColorsLight.primaryColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppColorsLight.errorColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppColorsLight.errorColor,
      ),
    ),
    labelStyle: const TextStyle(
      color: AppColorsLight.primaryColor,
    ),
    hintStyle: const TextStyle(
      color: AppColorsLight.grey,
    ),
  ),
);

class AppColorsLight {
  static const Color primaryColor = Color(0xFF6200EE);
  static const Color primaryColorDark = Color(0xFF3700B3);
  static const Color primaryColorLight = Color(0xFFBB86FC);
  static const Color secondaryColor = Color(0xFF03DAC5);
  static const Color secondaryColorDark = Color(0xFF018786);
  static const Color secondaryColorLight = Color(0xFF03DAC5);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFF121212);
  static const Color errorColor = Color(0xFFCF6679);
  static const Color onPrimaryColor = Color(0xFFFFFFFF);
  static const Color onSecondaryColor = Color(0xFF000000);
  static const Color onSurfaceColor = Color(0xFF000000);
  static const Color onBackgroundColor = Color(0xFFFFFFFF);
  static const Color grey = Color.fromARGB(255, 194, 194, 194);
}
