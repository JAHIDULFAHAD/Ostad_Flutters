import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Data/Services/api_caller.dart';
import 'package:task_manager/Ui/Screen/login_screen.dart';
import 'package:task_manager/Ui/Screen/reset_password_screen.dart';
import 'package:task_manager/Ui/Screen/sign_up_screen.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';

import '../../Data/Utils/urls.dart';
import '../Controllers/verify_otp_provider.dart';
import '../Widgets/snack_bar_message.dart';

class FrogetPasswordVerifyOtpScreen extends StatefulWidget {
  const FrogetPasswordVerifyOtpScreen({super.key, required this.email});
  final String email;
  static const String name = '/forgetpasswordverifyotp';

  @override
  State<FrogetPasswordVerifyOtpScreen> createState() =>
      _FrogetPasswordVerifyOtpScreenState();
}

class _FrogetPasswordVerifyOtpScreenState
    extends State<FrogetPasswordVerifyOtpScreen> {
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 90),
                  Text(
                    'Enter Your Otp',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'A 6 digit otp has been sent to your email address',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                  ),
                  SizedBox(height: 24),
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
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter otp';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Consumer<VerifyOtpProvider>(
                    builder: (context, verifyOtpProvider, _) {
                      return Visibility(
                        visible: verifyOtpProvider.otpVerifyInProgress == false,
                        replacement: Center(child: CircularProgressIndicator()),
                        child: FilledButton(
                          onPressed: _onTapVerifyButton,
                          child: Text('Verify'),
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
                            text: "Already have an account? ",
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
    Navigator.pushNamedAndRemoveUntil(
      context,
      LoginScreen.name,
      (Prediacte) => false,
    );
  }

  void _onTapVerifyButton() {
    if (_formKey.currentState!.validate()) {
      _verifyOtp();
    }
  }

  Future<void> _verifyOtp() async {
    final bool isSucces = await context.read<VerifyOtpProvider>().verifyOtp(
      context: context,
      email: widget.email,
      otp: _otpController.text.trim(),
    );
    if (isSucces) {
      showSnackbarMessage(context, 'OTP verified successfully');
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(
            email: widget.email,
            otp: _otpController.text.trim(),
          ),
        ),
            (route) => false,
      );
    } else {
      showSnackbarMessage(context, context.read<VerifyOtpProvider>().errorMessage);
    }
  }

  dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
