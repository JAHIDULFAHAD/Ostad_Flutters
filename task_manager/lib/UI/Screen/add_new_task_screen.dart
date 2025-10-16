import 'package:flutter/material.dart';
import 'package:task_manager/Data/Services/api_caller.dart';
import 'package:task_manager/Data/Utils/urls.dart';
import 'package:task_manager/Ui/Screen/splash_screen.dart';
import 'package:task_manager/Ui/Widgets/centered_progress_indicator.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'package:task_manager/Ui/Widgets/snack_bar_message.dart';

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
  bool _addNewTaskInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    "Add New Task",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _titleController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: "Title"),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Your Title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 6,
                    decoration: InputDecoration(hintText: "Description"),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Your Title';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Visibility(
                    visible: _addNewTaskInProgress == false,
                      replacement: CenteredProgressIndicator(),
                      child: FilledButton(onPressed: _onTapAddButton, child: Text("Add "))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapAddButton(){
    if(_formKey.currentState!.validate()){
      _addNewTask();
    }
  }
  Future<void> _addNewTask() async {
    _addNewTaskInProgress = true;
    setState(() {
    });
    Map<String, dynamic> requestBody = {
      "title":_titleController.text.trim(),
      "description":_descriptionController.text.trim(),
      "status":"New"
    };
    final ApiResponse response = await ApiCaller.postRequest(
        url: Urls.createTaskUrl,body: requestBody);
    _addNewTaskInProgress = false;
    setState(() {
    });
    if(response.isSuccess){
      _clearTextFileds();
      showSnackbarMessage(context, 'New task has been added');
    } else {
      showSnackbarMessage(context, response.errorMessage!);
    }
  }
  void _clearTextFileds(){
    _titleController.clear();
    _descriptionController.clear();
  }
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
