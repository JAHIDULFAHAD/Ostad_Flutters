import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/providers/sing_up_provider.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../common/presentation/widgets/center_circular_progress.dart';
import '../../../common/presentation/widgets/snack_bar_message.dart';
import '../../data/models/sign_up_params.dart';
import '../widgets/app_logo.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpProvider _signUpProvider = SignUpProvider();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme =TextTheme.of(context);
    return ChangeNotifierProvider(
      create: (_) => _signUpProvider,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
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
                    Text(context.localization.sign_up,style: textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold ,),),
                    Text(context.localization.signup_header,style: textTheme.bodyLarge,),
                    SizedBox(height: 16,),
                    TextFormField(
                      controller: _firstNameTEController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: context.localization.first_name),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return context.localization.first_name_error;
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _lastNameTEController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: context.localization.last_name),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return context.localization.last_name_error;
                        }
                        return null;
                      },
                    ),
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
                      controller: _phoneTEController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(hintText: context.localization.phone),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return context.localization.phone_error;
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _cityTEController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: context.localization.city),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return context.localization.city;
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
                    Consumer<SignUpProvider>(
                      builder: (context,signUpProvider, child) {
                        return Visibility(
                          visible: signUpProvider.isSignUpInProgress == false,
                          replacement:CenterCircularProgress(),
                          child: FilledButton(
                            onPressed: _onTapSignUpButton,
                            child: Text(context.localization.sign_up),
                          ),
                        );
                      }
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
          ),
        ),
      ),
    );
  }
  void _onTapSignUpButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }
  Future<void> _signUp() async {
    final isSuccess = await _signUpProvider.signUp(
      SignUpParams(
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        email: _emailTEController.text.trim(),
        phone: _phoneTEController.text.trim(),
        city: _cityTEController.text.trim(),
        password: _passwordTEController.text,
      ),
    );
    if (isSuccess) {
      Navigator.pushNamed(context, VerifyOtpScreen.name,arguments: _emailTEController.text.trim());
    } else {
      showSnackBarMessage(context, _signUpProvider.errorMessage!);
    }
  }
  void _onTapSignInButton() {
    Navigator.pushNamed(context, SignInScreen.name);

  }
  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _emailTEController.dispose();
    _phoneTEController.dispose();
    _cityTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}

