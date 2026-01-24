import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/screens/setting_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/common/presentation/screens/main_nav_holder_screen.dart';
import 'package:crafty_bay/features/common/presentation/widgets/center_circular_progress.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../common/presentation/widgets/snack_bar_message.dart';
import '../../data/models/sign_in_params.dart';
import '../providers/sign_in_provider.dart';
import '../widgets/app_logo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final SignInProvider _signInProvider = SignInProvider();

  @override
  Widget build(BuildContext context) {
    final textTheme =TextTheme.of(context);
    return ChangeNotifierProvider(
      create: (_) => _signInProvider,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                spacing: 8,
                children: [
                  AppLogo(width: 90),
                  SizedBox(height: 8,),
                  Text(context.localization.sign_in,style: textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold ,),),
                  Text(context.localization.signin_header,textAlign:TextAlign.center,style: textTheme.bodyLarge,),
                  SizedBox(height: 16,),
                  TextFormField(
                    controller: _emailTEController,
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
                    controller: _passwordTEController,
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
                  Consumer<SignInProvider>(
                    builder: (context,_,__) {
                      if(_signInProvider.isSignInProgress){
                        return CenterCircularProgress();
                      }
                      return FilledButton(
                        onPressed: _onTapSignInButton,
                        child: Text(context.localization.sign_in),
                      );
                    }
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
                          recognizer: TapGestureRecognizer()..onTap = _onTapSignUpButton,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _onTapForgotPassword() {
  }
  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }
  void _onTapSignInButton() {
    if(_formKey.currentState!.validate()){
      _signUp();
    }
  }
  Future<void> _signUp() async {
    SignInParams params = SignInParams(
      email: _emailTEController.text.trim(),
      password: _passwordTEController.text,
    );
    final bool isSuccess = await _signInProvider.signIn(params);
    if(isSuccess){
      Navigator.pushNamedAndRemoveUntil(context, MainNavHolderScreen.name, (predicate) => false);
    } else {
      showSnackBarMessage(context, _signInProvider.errorMessage!);
    }
  }
}
