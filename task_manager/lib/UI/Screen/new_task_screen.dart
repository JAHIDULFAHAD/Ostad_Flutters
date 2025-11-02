import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Data/Models/task_model.dart';
import 'package:task_manager/Data/Models/task_status_count.dart';
import 'package:task_manager/Data/Services/api_caller.dart';
import 'package:task_manager/Data/Utils/urls.dart';
import 'package:task_manager/Ui/Controllers/new_task_provider.dart';
import 'package:task_manager/Ui/Widgets/centered_progress_indicator.dart';
import 'package:task_manager/Ui/Widgets/snack_bar_message.dart';

import '../Controllers/all_task_status_count_provider.dart';
import '../Widgets/task_card.dart';
import '../Widgets/task_count_by_status_card.dart';
import 'add_new_task_screen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  static const String name = '/newtask';

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AllTaskStatusCountProvider>().getAllTaskStatusCount(context:context);
    context.read<NewTaskProvider>().getAllNewTask(context:context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            SizedBox(
              height: 90,
              child: Consumer<AllTaskStatusCountProvider>(
                builder: (context, allTaskStatusCountProvider, _) {
                  return Visibility(
                    visible: allTaskStatusCountProvider.getAllTaskStatusCountInProgress == false,
                    replacement: CenteredProgressIndicator(),
                    child: ListView.separated(
                      itemCount: allTaskStatusCountProvider.taskStatusCountList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TaskCountByStatusCard(
                          count: allTaskStatusCountProvider.taskStatusCountList[index].count,
                          title: allTaskStatusCountProvider.taskStatusCountList[index].status,

                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 4);
                      },
                    ),
                  );
                }
              ),
            ),
            Expanded(
              child: Consumer<NewTaskProvider>(
                builder: (context, newTaskProvider, _) {
                  return Visibility(
                    visible: newTaskProvider.getNewTaskInProgress == false,
                    replacement: CenteredProgressIndicator(),
                    child: ListView.separated(
                      itemCount: newTaskProvider.newTaskList.length,
                      itemBuilder: (context, index) {
                        return TaskCard(taskModel: newTaskProvider.newTaskList[index],
                        refreshParent: (){
                          newTaskProvider.getAllNewTask(context:context);
                          context.read<AllTaskStatusCountProvider>().getAllTaskStatusCount(context:context);
                        },);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 8);
                      },
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onTapAddNewTask() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddNewTaskScreen()),
    );
  }
}
