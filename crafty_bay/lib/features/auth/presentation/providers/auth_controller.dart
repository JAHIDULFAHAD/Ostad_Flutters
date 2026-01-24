import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user_model.dart';

class AuthController {
  static const _tokenKey = "access_token";
  static const _userKey = "user_data";

  static UserModel? userModel;
  static String? accessToken;


  static Future<void> saveUserData(String token,UserModel user)async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(_tokenKey, token);
    preferences.setString(_userKey, jsonEncode(user.toJson()));
    accessToken = token;
    userModel = user;
  }
  static Future<void> getUserData()async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    accessToken = preferences.getString(_tokenKey);
    if(accessToken != null){
      final String? userData = preferences.getString(_userKey);
      if(userData != null){
        userModel = UserModel.fromJson(jsonDecode(userData));
      }
    }
  }
  static Future<bool> isAlreadyLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(_tokenKey) != null;
  }
  static Future<void> ClearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

}