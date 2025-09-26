import 'package:flutter/material.dart';

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
                    return TaskCard(title: 'title', description: 'description', date: 'date', status: 'Cancelled',);
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



