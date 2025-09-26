import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/Ui/Screen/login_screen.dart';
import 'package:task_manager/Ui/Screen/sign_up_screen.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
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
                    ),
                    SizedBox(height: 24,),
                    TextFormField(
                      controller: _confirmpasswordController,
                      decoration: InputDecoration(
                        hintText: 'Confirm New Password',
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FilledButton(onPressed: _onTapConfirmButton,
                      child: Text('Confirm'),
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
    Navigator.pushNamedAndRemoveUntil(context,
      LoginScreen.name,(Prediacte)=>false,);
  }
  dispose(){
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }
}
