import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Ui/Controllers/progress_task_provider.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProgressTaskProvider>().getAllProgressTask(context:context);
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
                Consumer<ProgressTaskProvider>(
                  builder: (context, allProgressTaskProvider, _) {
                    return Visibility(
                      visible: allProgressTaskProvider.getProgressTaskInProgress == false,
                      replacement: CenteredProgressIndicator(),
                      child: ListView.separated(
                          itemCount: allProgressTaskProvider.progressTaskList.length,
                          itemBuilder: (context,index) {
                            return TaskCard(taskModel: allProgressTaskProvider.progressTaskList[index], refreshParent: (){
                              allProgressTaskProvider.getAllProgressTask(context:context);
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



