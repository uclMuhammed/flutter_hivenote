import 'package:flutter/material.dart';
import 'package:flutter_hivenote/theme/model/theme_model.dart';
import 'package:flutter_hivenote/theme/service/theme_service.dart';

class ThemeProvider with ChangeNotifier {
  final ThemeService _themeService = ThemeService();

  ThemeProvider() {
    _init();
  }

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void _init() async {
    await _themeService.init();
    _isDarkMode = _themeService.getTheme().isDarkMode;
    notifyListeners();
  }

  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await _themeService.setTheme(ThemeModel(isDarkMode: _isDarkMode));
    notifyListeners();
  }
}
