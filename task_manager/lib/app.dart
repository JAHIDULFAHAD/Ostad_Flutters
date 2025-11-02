import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Ui/Controllers/add_new_task_provider.dart';
import 'package:task_manager/Ui/Controllers/auth_controller.dart';
import 'package:task_manager/Ui/Controllers/progress_task_provider.dart';

import 'Ui/Controllers/all_task_status_count_provider.dart';
import 'Ui/Controllers/cancelled_task_provider.dart';
import 'Ui/Controllers/completed_task_provider.dart';
import 'Ui/Controllers/new_task_provider.dart';
import 'Ui/Controllers/task_change_status_provider.dart';
import 'Ui/Controllers/task_delete_provider.dart';
import 'Ui/Controllers/update_profile_provider.dart';
import 'Ui/Screen/forget_password_verify_email_screen.dart';
import 'Ui/Screen/forget_password_verify_otp_screen.dart';
import 'Ui/Screen/login_screen.dart';
import 'Ui/Screen/main_nav_bar_holder_screen.dart';
import 'Ui/Screen/reset_password_screen.dart';
import 'Ui/Screen/sign_up_screen.dart';
import 'Ui/Screen/splash_screen.dart';
import 'Ui/Screen/update_profile_screen.dart';
class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  static GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewTaskProvider()),
        ChangeNotifierProvider(create: (context) => AllTaskStatusCountProvider()),
        ChangeNotifierProvider(create: (context) => AddNewTaskProvider()),
        ChangeNotifierProvider(create: (context) => TaskChangeStatusProvider()),
        ChangeNotifierProvider(create: (context) => TaskDeleteProvider()),
        ChangeNotifierProvider(create: (context) => ProgressTaskProvider()),
        ChangeNotifierProvider(create: (context) => CancelledTaskProvider()),
        ChangeNotifierProvider(create: (context) => CompletedTaskProvider()),
        ChangeNotifierProvider(create: (context) => UpdateProfileProvider()),
        ChangeNotifierProvider(create: (context) => AuthController()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigator,
        theme: ThemeData(
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            )
          ),
        colorSchemeSeed: Colors.green,
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            hintStyle: TextStyle(
                color: Colors.grey
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide.none
            ),
            errorBorder:  OutlineInputBorder(
                borderSide: BorderSide.none
            ),
            enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide.none
            ),

          ),
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 12),
                fixedSize: Size.fromWidth(double.maxFinite),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                )
            ),
        ),
        ),
        initialRoute: SplashScreen.name,
        routes: {
          SplashScreen.name : (_) => SplashScreen(),
          LoginScreen.name : (_) => LoginScreen(),
          SignUpScreen.name : (_) => SignUpScreen(),
          MainNavBarHolderScreen.name : (_) => MainNavBarHolderScreen(),
          UpdateProfileScreen.name : (_) => UpdateProfileScreen(),
          FrogetPasswordVerifyEmailScreen.name : (_) => FrogetPasswordVerifyEmailScreen(),



        },
      ),
    );
  }
}
