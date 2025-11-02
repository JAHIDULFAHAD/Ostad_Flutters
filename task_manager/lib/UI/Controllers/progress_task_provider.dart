import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../Data/Models/task_model.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';
import 'auth_controller.dart';

class ProgressTaskProvider extends ChangeNotifier {
  bool _getProgressTaskInProgress = false;
  List<TaskModel> _progressTaskList = [];
  String _errorMessage = '';

  bool get getProgressTaskInProgress => _getProgressTaskInProgress;
  List<TaskModel> get progressTaskList => _progressTaskList;
  String get errorMessage => _errorMessage;

  Future<bool> getAllProgressTask({required BuildContext context}) async {
    _getProgressTaskInProgress = true;
    notifyListeners();

    final token = context.read<AuthController>().accessToken;

    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.progressTaskListUrl,
      token: token,
    );

    _getProgressTaskInProgress = false;

    if (response.isSuccess) {
      List<TaskModel> list = [];
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
      _progressTaskList = list;
      notifyListeners();
      return true;
    } else {
      _errorMessage = response.errorMessage ?? 'Something went wrong';
      notifyListeners();
      return false;
    }
  }
}
