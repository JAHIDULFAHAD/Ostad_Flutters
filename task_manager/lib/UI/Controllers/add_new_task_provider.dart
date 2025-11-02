import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';
import 'auth_controller.dart';

class AddNewTaskProvider extends ChangeNotifier {
  bool _addNewTaskInProgress = false;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;
  bool get addNewTaskInProgress => _addNewTaskInProgress;

  Future<bool> addNewTask({
    required BuildContext context,
    required String title,
    required String description,
    required String status,
  }) async {
    _addNewTaskInProgress = true;
    notifyListeners();

    Map<String, dynamic> requestBody = {
      "title": title,
      "description": description,
      "status": status,
    };

    final token = context.read<AuthController>().accessToken;

    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.createTaskUrl,
      body: requestBody,
      token: token,
    );

    _addNewTaskInProgress = false;
    notifyListeners();

    if (response.isSuccess) {
      return true;
    } else {
      _errorMessage = response.errorMessage ?? 'Something went wrong';
      return false;
    }
  }
}
