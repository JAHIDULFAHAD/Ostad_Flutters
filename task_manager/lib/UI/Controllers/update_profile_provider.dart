import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../Data/Models/user_model.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';
import 'auth_controller.dart';
import 'package:provider/provider.dart';

class UpdateProfileProvider extends ChangeNotifier {
  bool _updateProfileInProgress = false;
  String _errorMessage = '';

  bool get getUpdateProfileInProgress => _updateProfileInProgress;
  String get errorMessage => _errorMessage;

  Future<bool> updateProfile({
    required BuildContext context,
    required String email,
    required String firstname,
    required String lastname,
    required String phonenumber,
    String? password,
    XFile? image,
  }) async {
    _updateProfileInProgress = true;
    notifyListeners();

    final Map<String, dynamic> requestBody = {
      'email': email,
      'firstName': firstname,
      'lastName': lastname,
      'mobile': phonenumber,
    };

    if (password != null && password.isNotEmpty) {
      requestBody['password'] = password;
    }

    if (image != null) {
      final bytes = await image.readAsBytes();
      requestBody['photo'] = base64Encode(bytes);
    }

    final token = context.read<AuthController>().accessToken;
    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.updateProfileUrl,
      body: requestBody,
      token: token,
    );

    _updateProfileInProgress = false;

    if (response.isSuccess) {
      final updatedUser = UserModel(
        id: context.read<AuthController>().userModel!.id,
        email: email,
        firstName: firstname,
        lastName: lastname,
        mobile: phonenumber,
        photo: requestBody['photo'] ?? context.read<AuthController>().userModel!.photo,
      );

      await context.read<AuthController>().updateUserData(updatedUser);
      notifyListeners();
      return true;
    } else {
      _errorMessage = response.errorMessage ?? 'Update failed';
      notifyListeners();
      return false;
    }
  }
}


