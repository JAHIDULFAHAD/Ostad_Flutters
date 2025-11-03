import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Data/Services/api_caller.dart';
import 'package:task_manager/Ui/Screen/login_screen.dart';
import 'package:task_manager/Ui/Screen/sign_up_screen.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';

import '../../Data/Utils/urls.dart';
import '../Controllers/reset_password_provider.dart';
import '../Widgets/snack_bar_message.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.email, required this.otp});
  final String email;
  final String otp;
  static const String name = '/resetpassword';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
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
                    SizedBox(height: 90,),
                    Text('Reset Your Password',style: Theme.of(context).textTheme.titleLarge,),
                    SizedBox(height: 4,),
                    Text('Password Should be more than 6 latters and combination of numbers',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),),
                    SizedBox(height: 24,),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'New Password',
                      ),
                      validator: (String? value) {
                        if ((value?.length ?? 0) <= 6) {
                          return 'Password should more than 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24,),
                    TextFormField(
                      controller: _confirmpasswordController,
                      decoration: InputDecoration(
                        hintText: 'Confirm New Password',
                      ),
                      validator: (String? value) {
                        if ((value?.length ?? 0) <= 6) {
                          return 'Password should more than 6 characters';
                        } else {
                          if (_passwordController.text.trim() !=
                              _confirmpasswordController.text.trim()) {
                            return 'Password does not match';
                          }
                          return null;
                        };
                      }
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Consumer<ResetPasswordProvider>(
                      builder: (context, provider, _) {
                        return Visibility(
                          visible: provider.resetPasswordInProgress == false,
                          replacement: Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: FilledButton(onPressed: _onTapConfirmButton,
                            child: Text('Confirm'),
                          ),
                        );
                      }
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Center(
                      child: Column(
                        children: [
                          RichText(text: TextSpan(
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                              text: "Already have an account? ",
                              children: [TextSpan(
                                text:"Login",
                                style: TextStyle(color: Colors.green),
                                recognizer: TapGestureRecognizer()..onTap = _onTapLoginButton,
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
  void _onTapLoginButton(){
    Navigator.pushNamedAndRemoveUntil(context,
        LoginScreen.name,(Prediacte)=>false,);
  }
  void _onTapConfirmButton(){
    if(_formKey.currentState!.validate()){
      _changePassword();
    }
  }
  Future<void> _changePassword() async {
    final bool isSuccess = await context.read<ResetPasswordProvider>().changePassword(
      context: context,
      email: widget.email,
      otp: widget.otp,
      password: _passwordController.text.trim(),
    );
    if(isSuccess){
      showSnackbarMessage(context, 'Password changed successfully');
      Navigator.pushReplacementNamed(context, LoginScreen.name,);
    }else {
      showSnackbarMessage(context, context.read<ResetPasswordProvider>().errorMessage);
    }
  }
  dispose(){
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }
}
