import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:students_management/student.dart';

import 'add_student_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Student> _studentList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Students Details'), centerTitle: true),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('students').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            _studentList.clear();
            for (QueryDocumentSnapshot<Map<String, dynamic>> doc
            in snapshot.data!.docs) {
              _studentList.add(
                Student(
                  id: doc.id,
                  name: doc['name'],
                  student_id: doc['roll_Number'],
                  department: doc['course'],
                ),
              );
            }
            return ListView.builder(
              itemCount: _studentList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Name:- ${_studentList[index].name}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5,),
                      Text('Id:- ${_studentList[index].student_id}'),
                      SizedBox(height: 5),
                      Text('Department:- ${_studentList[index].department}'),
                    ],
                  ),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStudentScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
