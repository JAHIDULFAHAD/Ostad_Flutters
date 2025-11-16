import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_live_score_app/login_screen.dart';
import 'package:firebase_live_score_app/sign_up_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
class FootballLiveScoreApp extends StatefulWidget {
  const FootballLiveScoreApp({super.key});

  @override
  State<FootballLiveScoreApp> createState() => _FootballLiveScoreAppState();
}

class _FootballLiveScoreAppState extends State<FootballLiveScoreApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Live Score App',
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        }
      ),
    );
  }
}
