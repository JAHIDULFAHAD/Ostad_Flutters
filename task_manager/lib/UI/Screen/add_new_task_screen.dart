import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Screen/splash_screen.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';

import '../Widgets/tm_app_bar.dart';
class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});
  static const String name = '/addnewtask';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40,),
                  Text("Add New Task",style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 16,),
                  TextField(
                    controller: _titleController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: "Title",
                    ),
                  ),
                  const SizedBox(height: 10,),
                   TextField(
                     controller: _descriptionController,
                    decoration: InputDecoration(
                      hintText: "Description",
                    ),
                    maxLines: 6,
                  ),
                  const SizedBox(height: 16,),
                  FilledButton(onPressed: (){}, child:  Text("Add ")),

                ],
              ),
            ),
          )
        )
      ),
    );
  }
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
