import 'package:flutter/material.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';

class VerifyOtpProvider extends ChangeNotifier {
  bool _otpVerifyInProgress = false;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;
  bool get otpVerifyInProgress => _otpVerifyInProgress;

  Future<bool> verifyOtp({
    required BuildContext context,
    required String email,
    required String otp,
  }) async {
    bool isSucces = false;
    _otpVerifyInProgress = true;
    notifyListeners();

    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.otpVerifyUrl(email.trim(), otp.trim()),
    );

    _otpVerifyInProgress = false;
    notifyListeners();

    if (response.isSuccess) {
      isSucces = true;
    } else {
      _errorMessage = response.errorMessage!;
    }
    return isSucces;
    }
}
