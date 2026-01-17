import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final String _themeKey = 'themeMode';
  ThemeMode _currentThemeMode = ThemeMode.system;

  ThemeMode get currentThemeMode => _currentThemeMode;

  Future<void> loadInitialTheme() async {
    ThemeMode mode = await _getThemeMode();
    _currentThemeMode = mode;
    notifyListeners();
  }

  void changeLocale(ThemeMode mode) {
    if (mode == _currentThemeMode) return;
    _currentThemeMode = mode;
    _saveThemeMode(mode.name);
    notifyListeners();
  }

  Future<void> _saveThemeMode(String mode) async {
    SharedPreferences shredPreferences = await SharedPreferences.getInstance();
    await shredPreferences.setString(_themeKey, mode);
  }

  Future<ThemeMode> _getThemeMode() async {
    SharedPreferences shredPreferences = await SharedPreferences.getInstance();
    String? savedTheme = shredPreferences.getString(_themeKey) ?? ' ';
    return getThemeModeFromString(savedTheme);
  }

  ThemeMode getThemeModeFromString(String v) {
    switch (v) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
