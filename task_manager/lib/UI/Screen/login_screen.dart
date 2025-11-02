import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Data/Models/user_model.dart';
import 'package:task_manager/Data/Services/api_caller.dart';
import 'package:task_manager/Data/Utils/urls.dart';
import 'package:task_manager/Ui/Controllers/auth_controller.dart';
import 'package:task_manager/Ui/Screen/sign_up_screen.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'package:task_manager/Ui/Widgets/snack_bar_message.dart';
import '../Controllers/login_provider.dart';
import '../Widgets/centered_progress_indicator.dart';
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
  final LoginProvider _loginProvider = LoginProvider();



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _loginProvider,
      child: Scaffold(
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 90),
                    Text(
                      'Get Started With',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 24),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(hintText: 'Email'),
                      validator: (String? value) {
                        String inputText = value ?? '';
                        if (EmailValidator.validate(inputText) == false) {
                          return 'Enter valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(hintText: 'Password'),
                      validator: (String? value) {
                        if ((value?.length ?? 0) <= 6) {
                          return 'Password should more than 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Consumer<LoginProvider>(
                      builder: (context, loginProvider, _) {
                        return Visibility(
                          visible: _loginProvider.loginInProgress == false,
                          replacement: CenteredProgressIndicator(),
                          child: FilledButton(
                            onPressed: _onTapNextButton,
                            child: Icon(Icons.arrow_circle_right_outlined, size: 20),
                          ),
                        );
                      }
                    ),
                    SizedBox(height: 36),
                    Center(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: _onTapForgetPasswordButton,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              text: "Don't have an account? ",
                              children: [
                                TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(color: Colors.green),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = _onTapSignUpButton,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.pushReplacementNamed(context, SignUpScreen.name);
  }

  void _onTapForgetPasswordButton() {
    Navigator.pushReplacementNamed(
      context,
      FrogetPasswordVerifyEmailScreen.name,
    );
  }

  void _onTapNextButton() {
    if (_formKey.currentState!.validate()) {
      _login();
    }
  }

  Future<void> _login() async {
    final bool isSucces = await _loginProvider.login(
      context: context,
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    if (isSucces) {
      Navigator.pushReplacementNamed(context, MainNavBarHolderScreen.name);
    } else {
      showSnackbarMessage(context, _loginProvider.errorMessage);
    }
  }



  dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}


