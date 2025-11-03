import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Data/Services/api_caller.dart';
import 'package:task_manager/Ui/Screen/sign_up_screen.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';

import '../../Data/Models/task_model.dart';
import '../../Data/Utils/urls.dart';
import '../Controllers/verify_email_provider.dart';
import '../Widgets/snack_bar_message.dart';
import 'forget_password_verify_otp_screen.dart';

class FrogetPasswordVerifyEmailScreen extends StatefulWidget {
  const FrogetPasswordVerifyEmailScreen({super.key});
  static const String name = '/forgetpasswordverifyemail';

  @override
  State<FrogetPasswordVerifyEmailScreen> createState() =>
      _FrogetPasswordVerifyEmailScreenState();
}

class _FrogetPasswordVerifyEmailScreenState
    extends State<FrogetPasswordVerifyEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 90),
                  Text(
                    'Your Email Address',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'A 6 digit otp will be sent to your email address',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _emailController,
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
                  Consumer<VerifyEmailProvider>(
                    builder: (context, verifyEmailProvider, _) {
                      return Visibility(
                        visible: verifyEmailProvider.emailVerifyInProgress == false,
                        replacement: Center(child: CircularProgressIndicator()),
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
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            text: "Alrady have an account? ",
                            children: [
                              TextSpan(
                                text: "Login",
                                style: TextStyle(color: Colors.green),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = _onTapLoginButton,
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
    );
  }

  void _onTapLoginButton() {
    Navigator.pop(context);
  }

  void _onTapNextButton() {
    if (_formKey.currentState!.validate()) {
      _verifyEmail();
    }
  }

  Future<void> _verifyEmail() async {
   final bool isSucces = await context.read<VerifyEmailProvider>().verifyEmail(
      context: context,
      email: _emailController.text.trim(),
    );
   if(isSucces){
     Navigator.pushAndRemoveUntil(
       context,
       MaterialPageRoute(
         builder: (context) => FrogetPasswordVerifyOtpScreen(email: _emailController.text.trim()),
       ),
           (route) => false,
     );
   } else {
     showSnackbarMessage(context, context.read<VerifyEmailProvider>().errorMessage);
     }
  }

  dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
