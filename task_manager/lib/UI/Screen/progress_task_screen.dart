import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Widgets/centered_progress_indicator.dart';

import '../../Data/Models/task_model.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';
import '../Widgets/snack_bar_message.dart';
import '../Widgets/task_card.dart';
import '../Widgets/task_count_by_status_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});
  static const String name = '/progress';

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  bool _getProgressTaskInProgress = false;
  List<TaskModel> _newTaskList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllProgressTask();
  }
  Future<void> _getAllProgressTask() async {
    _getProgressTaskInProgress = true;
    setState(() {});

    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.progressTaskListUrl,
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
    _getProgressTaskInProgress = false;
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
              Expanded(child:
              Visibility(
                visible: _getProgressTaskInProgress == false,
                replacement: CenteredProgressIndicator(),
                child: ListView.separated(
                    itemCount: _newTaskList.length,
                    itemBuilder: (context,index) {
                      return TaskCard(taskModel: _newTaskList[index], refreshParent: (){
                        _getAllProgressTask();
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



