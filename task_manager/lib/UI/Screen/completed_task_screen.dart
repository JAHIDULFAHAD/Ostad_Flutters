import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Widgets/centered_progress_indicator.dart';

import '../../Data/Models/task_model.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';
import '../Widgets/snack_bar_message.dart';
import '../Widgets/task_card.dart';
import '../Widgets/task_count_by_status_card.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});
  static const String name = '/completed';

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  bool _getCompletedTaskInProgress = false;
  List<TaskModel> _newTaskList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllCompletedTask();
  }
  Future<void> _getAllCompletedTask() async {
    _getCompletedTaskInProgress = true;
    setState(() {});

    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.completedTaskListUrl,
    );

    if (response.isSuccess) {
      List<TaskModel> list = [];
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
      _newTaskList = list;
    } else {
      showSnackbarMessage(context, response.errorMessage!);
    }
    _getCompletedTaskInProgress = false;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            children: [
              const SizedBox(height: 16,),
              Visibility(
                visible: _getCompletedTaskInProgress == false,
                replacement: CenteredProgressIndicator(),
                child: Expanded(child:
                ListView.separated(
                    itemCount: _newTaskList.length,
                    itemBuilder: (context,index) {
                      return TaskCard(taskModel: _newTaskList[index], refreshParent: (){
                        _getAllCompletedTask();
                      });
                    },
                    separatorBuilder: (context,index) {
                      return SizedBox(
                        height: 8,
                      );
                    }),
                ),
              ),
            ]
        ),
      ),

    );
  }
}



