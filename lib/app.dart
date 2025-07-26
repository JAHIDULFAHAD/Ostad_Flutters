import 'package:flutter/material.dart';
import 'package:ostad_flutter/assignment.dart';
import 'package:ostad_flutter/stack.dart';

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      home:Assignment(),
    );
  }
}
