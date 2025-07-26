import 'package:flutter/material.dart';
import 'package:ostad_flutter/assignment.dart';
import 'package:ostad_flutter/stack.dart';

import 'alert_message.dart';
import 'drawer_tabbar.dart';

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      home:DrawerTabbar(),
    );
  }
}
