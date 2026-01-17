import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/screens/setting_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../widgets/app_logo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
              Text(context.localization.sign_in,style: textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold ,),),
              Text(context.localization.signin_header,textAlign:TextAlign.center,style: textTheme.bodyLarge,),
              SizedBox(height: 16,),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: context.localization.email),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return context.localization.email_error;
                  }
                  return null;
                },
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: InputDecoration(hintText: context.localization.password),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return context.localization.password_error;
                  }
                  return null;
                },
              ),
              FilledButton(
                onPressed: _onTapSignUpButton,
                child: Text(context.localization.sign_in),
              ),
              TextButton(onPressed: _onTapForgotPassword, child: Text(context.localization.forgot_password)),
              RichText(
                text: TextSpan(
                  text: context.localization.need_an_account,
                  style: textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: context.localization.sign_up,
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
  void _onTapForgotPassword() {
  }
  void _onTapSignUpButton() {
  }
  void _onTapSignInButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }
}
