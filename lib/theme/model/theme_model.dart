import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeModel extends ChangeNotifier {
  final ValueNotifier<bool> isDarkMode;

  ThemeModel(bool darkMode) : isDarkMode = ValueNotifier<bool>(darkMode);

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Hive.box('themeBox').put('isDarkMode', isDarkMode.value);
  }
}