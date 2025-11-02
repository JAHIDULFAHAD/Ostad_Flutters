import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Data/Models/user_model.dart';

class AuthController extends ChangeNotifier {
  static const String _accessTokenKey = 'token';
  static const String _userModelKey = 'model';

  String? _accessToken;
  UserModel? _userModel;

  String? get accessToken => _accessToken;
  UserModel? get userModel => _userModel;

  Future<void> saveUserData(UserModel model, String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, token);
    await prefs.setString(_userModelKey, jsonEncode(model.toJson()));
    _accessToken = token;
    _userModel = model;
    notifyListeners();
  }
  Future<void> updateUserData(UserModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userModelKey, jsonEncode(model.toJson()));
    _userModel = model;
    notifyListeners();
  }
  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(_accessTokenKey);
    if (token != null) {
      String? userData = prefs.getString(_userModelKey);
      if (userData != null) {
        _userModel = UserModel.fromJson(jsonDecode(userData));
        _accessToken = token;
      }
    }
    notifyListeners();
  }
  Future<bool> isUserAlreadyLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_accessTokenKey);
  }
  Future<void> clearUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _accessToken = null;
    _userModel = null;
    notifyListeners();
  }
}
