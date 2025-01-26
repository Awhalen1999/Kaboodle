import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF7A52F4),
    onPrimary: Colors.white,
    secondary: Color(0xFFF2BB98),
    onSecondary: Colors.black,
    tertiary: Color(0xFFEEDCFF),
    onTertiary: Colors.black,
    surface: Color(0xFF000000),
    onSurface: Colors.white,
    error: Color(0xFFFF3F3F),
    onError: Colors.white,
    shadow: Colors.grey,
    surfaceContainer: Color(0xFF1E1E1E),
  ),
  textTheme: ThemeData.dark().textTheme.copyWith(
        displayLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 32,
          letterSpacing: 1.5,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 28,
          letterSpacing: 1.5,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 24,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          color: Colors.grey[300],
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
          color: Colors.grey[300],
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w200,
          color: Colors.grey[300],
          fontSize: 12,
        ),
      ),
);
