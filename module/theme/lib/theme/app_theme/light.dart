import 'package:flutter/material.dart';
import 'package:theme/theme/app_colors/app_colors.dart';

final lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.lightPrimary,
    hintColor: AppColors.lightAccent,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        color: AppColors.lightAccent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        )),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.grey),
      displayLarge: TextStyle(
          fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
    ));
