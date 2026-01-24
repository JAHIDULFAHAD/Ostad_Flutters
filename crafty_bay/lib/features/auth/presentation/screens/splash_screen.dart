import 'package:flutter/material.dart';

import '../../../common/presentation/screens/main_nav_holder_screen.dart';
import '../providers/auth_controller.dart';
import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  static const String name = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }
  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    await AuthController.getUserData();
    Navigator.pushReplacementNamed(context, MainNavHolderScreen.name);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 24,)
          ],
        ),
      ),
    );
  }
}

