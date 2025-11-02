import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';
import 'auth_controller.dart';

class TaskDeleteProvider extends ChangeNotifier {
  bool _deleteStatusInProgress = false;
  String _errorMessage = '';

  bool get deleteStatusInProgress => _deleteStatusInProgress;
  String get errorMessage => _errorMessage;

  Future<bool> deleteStatus({
    required BuildContext context,
    required String id,
  }) async {
    _deleteStatusInProgress = true;
    notifyListeners();

    final token = context.read<AuthController>().accessToken;
    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.deleteTaskStatusUrl(id),
      token: token,
    );

    _deleteStatusInProgress = false;

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
