import 'package:flutter/material.dart';
import 'package:q8_task/app/resources/colors_resource.dart';

final ThemeData themeData = ThemeData(
  backgroundColor: Colors.white,
  primaryColor: lightPurple,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: lightPurple,
        secondary: lightPurple,
      ),
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.black.withOpacity(0.9),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);
