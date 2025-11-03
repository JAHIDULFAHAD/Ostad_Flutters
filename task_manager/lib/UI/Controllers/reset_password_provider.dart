import 'package:flutter/material.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';
import '../Widgets/snack_bar_message.dart';

class ResetPasswordProvider extends ChangeNotifier {
  bool _resetPasswordInProgress = false;
  String _errorMessage = '';

  bool get resetPasswordInProgress => _resetPasswordInProgress;
  String get errorMessage => _errorMessage;

  Future<bool> changePassword({
    required BuildContext context,
    required String email,
    required String otp,
    required String password,
  }) async {
    bool isSuccess = false;
    _resetPasswordInProgress = true;
    notifyListeners();

    final Map<String, dynamic> requestBody = {
      "email": email.trim(),
      "OTP": otp.trim(),
      "password": password.trim(),
    };

    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.changePasswordUrl,
      body: requestBody,
    );

    _resetPasswordInProgress = false;
    notifyListeners();

    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage ?? 'Something went wrong';
    }
    return isSuccess;
  }
}
