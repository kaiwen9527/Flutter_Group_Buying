import 'package:flutter/material.dart';

class AppThemeData {
  // ------------------------------------------------------------------ 日的部分

  static ThemeData lightMode = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.white,
    highlightColor: Colors.black54,
    primaryColorLight: Colors.blueGrey[400],
    indicatorColor: Colors.deepPurpleAccent,
    cardColor: Colors.black,
    disabledColor: Colors.white,
    hoverColor: Colors.blueGrey[50],
    hintColor: Colors.blueGrey[200],
    dividerColor: Colors.black,
    drawerTheme: DrawerThemeData(backgroundColor: Colors.blueAccent[50]),
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: Colors.deepPurpleAccent,
        inverseSurface: Colors.deepPurpleAccent[100]),
    splashColor: Colors.purple[50],
  );

  // ------------------------------------------------------------------ 夜的部分

  static ThemeData darkMode = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.white,
    primaryColorLight: Colors.white,
    highlightColor: Colors.white,
    indicatorColor: Colors.white,
    cardColor: Colors.white,
    hoverColor: Colors.brown[200],
    disabledColor: Colors.blueGrey,
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: Colors.deepPurpleAccent,
        inverseSurface: Colors.blueGrey),
    splashColor: Colors.brown[100],
  );
}
