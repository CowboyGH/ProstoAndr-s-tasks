import 'package:flutter/material.dart';

final mainTheme = ThemeData
(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    elevation: 0,
    backgroundColor: Colors.brown,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500
    ),
  ),

  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 16
    ),

    labelSmall: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w300,
      fontSize: 12
    ),
  ),
);