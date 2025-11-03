import 'package:flutter/material.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';

class SignUpProvider extends ChangeNotifier {
  bool _signUpInProgress = false;
  String _errorMessage = '';

  bool get signUpInProgress => _signUpInProgress;
  String get errorMessage => _errorMessage;

  Future<bool> signUp({
    required String email,
    required String firstName,
    required String lastName,
    required String mobile,
    required String password,
  }) async {
    bool isSuccess = false;
    _signUpInProgress = true;
    notifyListeners();

    final Map<String, dynamic> requestBody = {
      "email": email.trim(),
      "firstName": firstName.trim(),
      "lastName": lastName.trim(),
      "mobile": mobile.trim(),
      "password": password.trim(),
    };

    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.registrationUrl,
      body: requestBody,
    );

    _signUpInProgress = false;
    notifyListeners();

    if (response.isSuccess && response.responseData['status'] == 'success') {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage ?? 'Registration failed';
    }

    return isSuccess;
  }
}
