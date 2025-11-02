import 'dart:ffi';

import 'package:flutter/cupertino.dart';

import '../../Data/Models/user_model.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';
import 'auth_controller.dart';
import 'package:provider/provider.dart';

class LoginProvider extends ChangeNotifier {
  bool _loginInProgress = false;
  String _errorMessage = '';

  bool get loginInProgress => _loginInProgress;
  String get errorMessage => _errorMessage;

  Future<bool> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    _loginInProgress = true;
    notifyListeners();

    Map<String, dynamic> requestBody = {"email": email, "password": password};

    final authController = context.read<AuthController>();

    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.loginUrl,
      body: requestBody,
      token: authController.accessToken,
    );

    bool isSuccess = false;

    if (response.isSuccess && response.responseData['status'] == 'success') {
      UserModel model = UserModel.fromJson(response.responseData['data']);
      String accessToken = response.responseData['token'];

      await authController.saveUserData(model, accessToken);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage ?? 'Something went wrong';
    }

    _loginInProgress = false;
    notifyListeners();

    return isSuccess;
  }
}
