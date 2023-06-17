import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Color.fromARGB(255, 55, 55, 55),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color.fromARGB(255, 157, 157, 157),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
  colorScheme: const ColorScheme.dark(
    primary: AppColorDark.primaryColor,
    secondary: AppColorDark.secondaryColor,
    surface: AppColorDark.surfaceColor,
    background: AppColorDark.backgroundColor,
    error: AppColorDark.errorColor,
    onPrimary: AppColorDark.onPrimaryColor,
    onSecondary: AppColorDark.onSecondaryColor,
    onSurface: AppColorDark.onSurfaceColor,
    onBackground: AppColorDark.onBackgroundColor,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);

class AppColorDark {
  static const Color primaryColor = Color(0xFF6F35A5);
  static const Color secondaryColor = Color(0xFFF1E6FF);
  static const Color surfaceColor = Color(0xFF121212);
  static const Color backgroundColor = Color.fromARGB(255, 59, 59, 59);
  static const Color errorColor = Color(0xFFB00020);
  static const Color onPrimaryColor = Color(0xFFFFFFFF);
  static const Color onSecondaryColor = Color(0xFF000000);
  static const Color onSurfaceColor = Color(0xFFFFFFFF);
  static const Color onBackgroundColor = Color(0xFFFFFFFF);
}
