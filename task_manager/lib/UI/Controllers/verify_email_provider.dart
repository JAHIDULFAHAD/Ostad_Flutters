import 'package:flutter/material.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';
import '../Widgets/snack_bar_message.dart';

class VerifyEmailProvider extends ChangeNotifier {
  bool _emailVerifyInProgress = false;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;
  bool get emailVerifyInProgress => _emailVerifyInProgress;

  Future<bool> verifyEmail({
    required BuildContext context,
    required String email,
  }) async {
    bool isSucces = false;
    _emailVerifyInProgress = true;
    notifyListeners();

    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.emailVerifyUrl(email.trim()),
    );

    _emailVerifyInProgress = false;
    notifyListeners();

    if (response.isSuccess) {
      isSucces = true;
    } else {
      _errorMessage = response.errorMessage!;
    }
    return isSucces;
  }
}
