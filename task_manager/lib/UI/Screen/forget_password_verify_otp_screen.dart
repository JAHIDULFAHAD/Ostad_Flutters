import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/Ui/Screen/login_screen.dart';
import 'package:task_manager/Ui/Screen/reset_password_screen.dart';
import 'package:task_manager/Ui/Screen/sign_up_screen.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
class FrogetPasswordVerifyOtpScreen extends StatefulWidget {
  const FrogetPasswordVerifyOtpScreen({super.key});
  static const String name = '/forgetpasswordverifyotp';

  @override
  State<FrogetPasswordVerifyOtpScreen> createState() => _FrogetPasswordVerifyOtpScreenState();
}

class _FrogetPasswordVerifyOtpScreenState extends State<FrogetPasswordVerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();
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
                    Text('Enter Your Otp',style: Theme.of(context).textTheme.titleLarge,),
                    SizedBox(height: 4,),
                    Text('A 6 digit otp has been sent to your email address',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),),
                    SizedBox(height: 24,),
                    PinCodeTextField(
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      controller: _otpController,
                     appContext: context,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FilledButton(onPressed: _onTapVerifyButton,
                        child: Text('Verify'),
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
  void _onTapVerifyButton(){
    Navigator.pushReplacementNamed(context, ResetPasswordScreen.name,);
  }
  dispose(){
    _otpController.dispose();
    super.dispose();
  }
}
