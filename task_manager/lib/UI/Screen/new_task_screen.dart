import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16,),
            SizedBox(
              height: 90,
              child: ListView.separated(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index) {
                  return TaskCountByStatusCard(
                    count: 2,
                    title: 'New',
                  );
                },
                separatorBuilder: (context,index) {
                  return SizedBox(
                    width: 4,
                  );
                }
              ),
            ),
            Expanded(child:
              ListView.separated(
                itemCount: 10,
                itemBuilder: (context,index) {
                  return TaskCard(title: 'title', description: 'description', date: 'date', status: 'New',);
                },
              separatorBuilder: (context,index) {
                return SizedBox(
                  height: 8,
                );
              }),
              ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }
  void _onTapAddNewTask(){
    Navigator.push(context, MaterialPageRoute( builder: (context) => AddNewTaskScreen()));
  }
}



