import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
            children: [
              const SizedBox(height: 16,),
              Expanded(child:
              ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context,index) {
                    return TaskCard(title: 'title', description: 'description', date: 'date', status: 'Progress',);
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

    );
  }
}



