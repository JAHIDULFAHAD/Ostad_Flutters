import 'package:flutter/material.dart';
import 'package:ostad_flutter/assignment.dart';
import 'package:ostad_flutter/facebook_login.dart';
import 'package:ostad_flutter/own_widget.dart';
import 'package:ostad_flutter/raoute.dart';
import 'package:ostad_flutter/stack.dart';
import 'package:ostad_flutter/user_input.dart';

import 'alert_message.dart';
import 'drawer_tabbar.dart';

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        brightness: Brightness.light,
        primaryColor: Colors.deepPurpleAccent,
        primarySwatch: Colors.indigo,

        appBarTheme: AppBarTheme(
          color: Colors.cyanAccent
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
            foregroundColor: Colors.black,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.lightGreenAccent),

            )
          )
        ),
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            color: Colors.red,
            fontSize: 25,
            fontWeight: FontWeight.bold
          )
        ),

      ),
      title: 'First App',
      // initialRoute: '/home',
      // routes: {
      //   '/home':(context)=>OwnWidget(),
      //   '/Tour':(context)=>Assignment(),
      //   '/fb':(context)=>FacebookLogin(),
      //   '/input':(context)=>UserInput(),
      // },
      home: OwnWidget(),
    );
  }
}
