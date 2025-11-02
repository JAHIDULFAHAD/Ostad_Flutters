import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../Data/Models/task_model.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';
import 'auth_controller.dart';

class CompletedTaskProvider extends ChangeNotifier {
  bool _getCompletedTaskInProgress = false;
  List<TaskModel> _newTaskList = [];
  String _errorMessage = '';

  bool get getCompletedTaskInProgress => _getCompletedTaskInProgress;
  List<TaskModel> get newTaskList => _newTaskList;
  String get errorMessage => _errorMessage;

  Future<bool> getAllCompletedTask({required BuildContext context}) async {
    _getCompletedTaskInProgress = true;
    notifyListeners();

    final token = context.read<AuthController>().accessToken;

    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.completedTaskListUrl,
      token: token,
    );

    _getCompletedTaskInProgress = false;

    if (response.isSuccess) {
      List<TaskModel> list = [];
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
      _newTaskList = list;
      notifyListeners();
      return true;
    } else {
      _errorMessage = response.errorMessage ?? 'Something went wrong';
      notifyListeners();
      return false;
    }
  }
}
