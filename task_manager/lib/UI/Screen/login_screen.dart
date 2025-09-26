import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Ui/Screen/sign_up_screen.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';

import 'forget_password_verify_email_screen.dart';
import 'main_nav_bar_holder_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String name = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 90,),
                  Text('Get Started With',style: Theme.of(context).textTheme.titleLarge,),
                  SizedBox(height: 24,),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  FilledButton(onPressed: _onTapNextButton,
                      child: Icon(Icons.arrow_circle_right_outlined,size: 20,)
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Center(
                    child: Column(
                      children: [
                        TextButton(onPressed: _onTapForgetPasswordButton, child: Text('Forgot Password?',style: TextStyle(
                          color: Colors.grey
                        ),)),
                        RichText(text: TextSpan(
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                          text: "Don't have an account? ",
                          children: [TextSpan(
                            text:"Sign Up",
                            style: TextStyle(color: Colors.green),
                            recognizer: TapGestureRecognizer()..onTap = _onTapSignUpButton,
                          )]
                        )),
                      ],
                    ),
                  )
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _onTapSignUpButton(){
    Navigator.pushReplacementNamed(context, SignUpScreen.name);
  }
  void _onTapForgetPasswordButton(){
    Navigator.pushReplacementNamed(context, FrogetPasswordVerifyEmailScreen.name);
  }
  void _onTapNextButton(){
    Navigator.pushNamedAndRemoveUntil(context, MainNavBarHolderScreen.name,
        (predicate) => false,);
  }
  dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
