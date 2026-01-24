import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/providers/verify_otp_provider.dart';
import 'package:crafty_bay/features/auth/presentation/screens/setting_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../common/presentation/widgets/center_circular_progress.dart';
import '../../../common/presentation/widgets/snack_bar_message.dart';
import '../../data/models/verify_otp_params.dart';
import '../widgets/app_logo.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});
  final String email;
  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final VerifyOtpProvider _verifyOtpProvider = VerifyOtpProvider();

  @override
  Widget build(BuildContext context) {
    final textTheme =TextTheme.of(context);
    return ChangeNotifierProvider(
      create: (_) => _verifyOtpProvider,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
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
                    controller: _otpController,
                  ),
                  Consumer<VerifyOtpProvider>(
                    builder: (context,_,__) {
                      if(_verifyOtpProvider.isVerifyOtpInProgress){
                        return CenterCircularProgress();
                      }
                      return FilledButton(
                        onPressed: _onTapVerifyButton,
                        child: Text(context.localization.verify_otp),
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
    );
  }
  void _onTapVerifyButton() {
    if(_formKey.currentState!.validate()){
      _verifyOtp();
    }
  }
  Future<void> _verifyOtp() async {
    VerifyOtpParams params = VerifyOtpParams(
      email: widget.email,
      otp: _otpController.text.trim(),
    );
    final bool isSuccess = await _verifyOtpProvider.signUp(params);
    if(isSuccess){
      Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate) => false);
    } else {
      showSnackBarMessage(context, _verifyOtpProvider.errorMessage!);
    }
  }

  void _onTapSignInButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
  }
}
