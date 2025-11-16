import 'package:flutter/material.dart';
import 'home_screen.dart';
class StudentsManagement extends StatefulWidget {
  const StudentsManagement({super.key});

  @override
  State<StudentsManagement> createState() => _StudentsManagementState();
}

class _StudentsManagementState extends State<StudentsManagement> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Students Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: Colors.green.shade500
        ),
        listTileTheme: ListTileThemeData(
          titleTextStyle: TextStyle(
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          subtitleTextStyle: TextStyle(
            color: Colors.deepPurpleAccent,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
            tileColor: Colors.greenAccent.shade100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),

            side: BorderSide(
            color: Colors.deepPurpleAccent,
            width: 2,
          )
        )
      ),
      ),
      home: HomeScreen(),
    );
  }
}
