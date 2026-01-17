import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  final String _localKey = 'locale';
  Locale _currentLocale = Locale('en');

  Locale get currentLocale => _currentLocale;

  Future<void> loadInitialLanguage() async {
    Locale locale = await _getLocale();
    _currentLocale = locale;
    notifyListeners();
  }

  void changeLocale(Locale newLocale) {
    if (newLocale == _currentLocale) return;
    _currentLocale = newLocale;
    _saveLocale(_currentLocale.languageCode);
    notifyListeners();
  }
  Future<void> _saveLocale(String locale) async {
    SharedPreferences shredPreferences = await SharedPreferences.getInstance();
    await shredPreferences.setString(_localKey, locale);
  }
  Future<Locale> _getLocale() async {
    SharedPreferences shredPreferences = await SharedPreferences.getInstance();
    String? savedLocal = shredPreferences.getString(_localKey) ?? 'en';
    return Locale(savedLocal);
  }

}