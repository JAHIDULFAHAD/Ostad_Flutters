import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/screens/setting_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../app/app_colors.dart';
import '../widgets/app_logo.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});
  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme =TextTheme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            spacing: 8,
            children: [
              AppLogo(width: 90),
              SizedBox(height: 8,),
              Text(context.localization.verify_otp,style: textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold ,),),
              Text(context.localization.a_4_digit_otp_code_has_been_sent_to_your_email,textAlign:TextAlign.center,style: textTheme.bodyLarge,),
              SizedBox(height: 16,),
              PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                animationDuration: Duration(milliseconds: 300),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                ),
                appContext: context,
              ),
              FilledButton(
                onPressed: _onTapVerifyButton,
                child: Text(context.localization.verify_otp),
              ),
              RichText(
                text: TextSpan(
                  text: context.localization.already_have_account,
                  style: textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: context.localization.sign_in,
                      style: TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.bold
                      ),
                      recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _onTapVerifyButton() {
  }
  void _onTapSignInButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
  }
}
