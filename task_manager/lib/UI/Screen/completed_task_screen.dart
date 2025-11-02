import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Ui/Widgets/centered_progress_indicator.dart';

import '../../Data/Models/task_model.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';
import '../Controllers/completed_task_provider.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CompletedTaskProvider>().getAllCompletedTask(context:context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            children: [
              const SizedBox(height: 16,),
              Consumer<CompletedTaskProvider>(
                builder: (context, allCompletedTaskProvider, _) {
                  return Visibility(
                    visible: allCompletedTaskProvider.getCompletedTaskInProgress == false,
                    replacement: CenteredProgressIndicator(),
                    child: Expanded(child:
                    ListView.separated(
                        itemCount: allCompletedTaskProvider.newTaskList.length,
                        itemBuilder: (context,index) {
                          return TaskCard(taskModel: allCompletedTaskProvider.newTaskList[index], refreshParent: (){
                            allCompletedTaskProvider.getAllCompletedTask(context:context);
                          });
                        },
                        separatorBuilder: (context,index) {
                          return SizedBox(
                            height: 8,
                          );
                        }),
                    ),
                  );
                }
              ),
            ]
        ),
      ),

    );
  }
}



