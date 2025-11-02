import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../Data/Models/task_model.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';
import 'auth_controller.dart';

class NewTaskProvider extends ChangeNotifier {
  bool _getNewTaskInProgress = false;
  List<TaskModel> _newTaskList = [];
  String _errorMessage = '';

  List<TaskModel> get newTaskList => _newTaskList;
  String get errorMessage => _errorMessage;
  bool get getNewTaskInProgress => _getNewTaskInProgress;

  Future<bool> getAllNewTask({required BuildContext context}) async {
    _getNewTaskInProgress = true;
    notifyListeners();

    final token = context.read<AuthController>().accessToken;

    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.newTaskListUrl,
      token: token,
    );

    _getNewTaskInProgress = false;

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
