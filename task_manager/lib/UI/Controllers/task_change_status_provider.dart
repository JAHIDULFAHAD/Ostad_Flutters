import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';
import 'auth_controller.dart';

class TaskChangeStatusProvider extends ChangeNotifier {
  bool _changeStatusInProgress = false;
  String _errorMessage = '';

  bool get changeStatusInProgress => _changeStatusInProgress;
  String get errorMessage => _errorMessage;

  Future<bool> changeStatus({
    required BuildContext context,
    required String id,
    required String status,
  }) async {
    _changeStatusInProgress = true;
    notifyListeners();

    final token = context.read<AuthController>().accessToken;
    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.updateTaskStatusUrl(id, status),
      token: token,
    );

    _changeStatusInProgress = false;

    if (response.isSuccess) {
      notifyListeners();
      return true;
    } else {
      _errorMessage = response.errorMessage ?? 'Something went wrong';
      notifyListeners();
      return false;
    }
  }
}
