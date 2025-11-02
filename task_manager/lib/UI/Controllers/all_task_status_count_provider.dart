import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../Data/Models/task_status_count.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';
import 'auth_controller.dart';

class AllTaskStatusCountProvider extends ChangeNotifier {
  bool _getAllTaskStatusCountInProgress = false;
  List<TaskStatusCount> _taskStatusCountList = [];
  String _errorMessage = '';

  List<TaskStatusCount> get taskStatusCountList => _taskStatusCountList;
  String get errorMessage => _errorMessage;
  bool get getAllTaskStatusCountInProgress => _getAllTaskStatusCountInProgress;

  Future<bool> getAllTaskStatusCount({required BuildContext context}) async {
    _getAllTaskStatusCountInProgress = true;
    notifyListeners();

    final token = context.read<AuthController>().accessToken;

    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.taskStatusCount,
      token: token,
    );

    _getAllTaskStatusCountInProgress = false;

    if (response.isSuccess) {
      List<TaskStatusCount> list = [];
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        list.add(TaskStatusCount.fromJson(jsonData));
      }
      _taskStatusCountList = list;
      notifyListeners();
      return true;
    } else {
      _errorMessage = response.errorMessage ?? 'Something went wrong';
      notifyListeners();
      return false;
    }
  }
}
