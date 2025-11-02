import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Ui/Widgets/centered_progress_indicator.dart';

import '../../Data/Models/task_model.dart';
import '../../Data/Services/api_caller.dart';
import '../../Data/Utils/urls.dart';
import '../Controllers/cancelled_task_provider.dart';
import '../Widgets/snack_bar_message.dart';
import '../Widgets/task_card.dart';
import '../Widgets/task_count_by_status_card.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});
  static const String name = '/cancelled';

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CancelledTaskProvider>().getAllCancelledTask(context:context);
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
              Consumer<CancelledTaskProvider>(
                builder: (context, allCancelledTaskProvider, _) {
                  return Visibility(
                    visible: allCancelledTaskProvider.getCancelledTaskInProgress == false,
                    replacement: CenteredProgressIndicator(),
                    child: ListView.separated(
                        itemCount: allCancelledTaskProvider.newTaskList.length,
                        itemBuilder: (context,index) {
                          return TaskCard(taskModel: allCancelledTaskProvider.newTaskList[index], refreshParent: (){
                            allCancelledTaskProvider.getAllCancelledTask(context:context);
                          });
                        },
                        separatorBuilder: (context,index) {
                          return SizedBox(
                            height: 8,
                          );
                        }),
                  );
                }
              ),
              ),
            ]
        ),
      ),

    );
  }
}



