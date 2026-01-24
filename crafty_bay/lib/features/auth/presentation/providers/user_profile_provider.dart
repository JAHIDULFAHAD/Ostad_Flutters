import 'package:flutter/cupertino.dart';

import '../../data/models/user_model.dart';
import 'auth_controller.dart';

class UserProfileProvider extends ChangeNotifier {
  UserModel? user;
  bool loading = false;

  Future<void> loadUser() async {
    loading = true;
    notifyListeners();

    await AuthController.getUserData();
    user = AuthController.userModel;

    loading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    await AuthController.ClearUserData();
    user = null;
    notifyListeners();
  }
}
