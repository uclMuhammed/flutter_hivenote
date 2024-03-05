import 'package:flutter/material.dart';
import 'package:theme/theme/app_colors/app_colors.dart';


final darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.darkPrimary,
    hintColor: AppColors.darkAccent,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: const AppBarTheme(
        color: AppColors.darkAccent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        )),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Color(0xffe0e0e0)),
      displayLarge: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
    ));
