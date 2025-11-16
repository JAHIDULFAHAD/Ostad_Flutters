import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Student')),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            spacing: 8,
            children: [
              TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Student Name'),
                  validator: (String? value) {
                    if (value!.trim().isEmpty == true) {
                      return 'Please enter name';
                    }
                    return null;
                  }
              ),
              TextFormField(
                  controller: _idController,
                  decoration: const InputDecoration(labelText: 'Student Id'),
                  validator: (String? value) {
                    if (value!.trim().isEmpty == true) {
                      return 'Please enter id';
                    }
                    return null;
                  }
              ),
              TextFormField(
                  controller: _courseController,
                  decoration: const InputDecoration(
                      labelText: 'Student Crouse'),
                  validator: (String? value) {
                    if (value!.trim().isEmpty == true) {
                      return 'Please enter course';
                    }
                    return null;
                  }
              ),
              FilledButton(
                onPressed: () {
                  _addStudent();
                },
                child: const Text('Add Student'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addStudent() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    FirebaseFirestore.instance.collection('students').doc().set({
      'name': _nameController.text,
      'roll_Number': int.parse(_idController.text),
      'course': _courseController.text,
    });
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Student Added')),
    );
  }
}
