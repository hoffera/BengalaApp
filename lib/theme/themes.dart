import 'package:flutter/material.dart';

ThemeData primaryThemeData = ThemeData(
  fontFamily: 'SourceSans',
  colorScheme: const ColorScheme(
    primary: Colors.white,
    secondary: Colors.black,
    error: Colors.red,
    surface: Colors.black,
    onError: Colors.red,
    outline: Colors.white,
    outlineVariant: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      side: const BorderSide(color: Colors.white), // Borda do botão
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white, // Define os ícones para a cor branca
  ),
);

ThemeData deuteranopiThemeData = ThemeData(
  iconTheme: const IconThemeData(
    color: Colors.black, // Define os ícones para a cor branca
  ),
  fontFamily: 'SourceSans',
  colorScheme: const ColorScheme(
      primary: Colors.black, //black
      secondary: Colors.white,
      error: Colors.red,
      surface: Colors.white,
      onError: Colors.red,
      outline: Colors.black, //black
      outlineVariant: Colors.black, //black
      onPrimary: Colors.black, //black
      onSecondary: Colors.white, //black
      onSurface: Colors.black, //black
      brightness: Brightness.dark),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.black), // roxo
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.black, //black
      backgroundColor: Colors.white,

      side: const BorderSide(color: Colors.black), //black
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  ),
);

ThemeData protanopiaThemeData = ThemeData(
  fontFamily: 'SourceSans',
  colorScheme: const ColorScheme(
      primary: Colors.black, //black
      secondary: Colors.yellow,
      error: Colors.red,
      surface: Colors.yellow,
      onError: Colors.red,
      outline: Colors.black, //black
      outlineVariant: Colors.black, //black
      onPrimary: Colors.black, //black
      onSecondary: Colors.yellow, //black
      onSurface: Colors.black, //black
      brightness: Brightness.dark),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.black), // roxo
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.black, //black
      backgroundColor: Colors.yellow,

      side: const BorderSide(color: Colors.black), //black
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  ),
);

ThemeData tritanopiaThemeData = ThemeData(
  fontFamily: 'SourceSans',
  colorScheme: const ColorScheme(
      primary: Colors.blue, //black
      secondary: Colors.white,
      error: Colors.red,
      surface: Colors.white,
      onError: Colors.red,
      outline: Colors.blue, //black
      outlineVariant: Colors.blue, //black
      onPrimary: Colors.blue, //black
      onSecondary: Colors.white, //black
      onSurface: Colors.blue, //black
      brightness: Brightness.dark),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.blue), // roxo
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.blue, //black
      backgroundColor: Colors.white,

      side: const BorderSide(color: Colors.blue), //black
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
  ),
);
