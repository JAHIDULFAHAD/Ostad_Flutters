import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/Data/Services/api_caller.dart';
import 'package:task_manager/Data/Utils/urls.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'package:task_manager/Ui/Widgets/snack_bar_message.dart';

import 'login_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String name = '/signup';

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _signUpInProgress = false;

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
                    Text('Join With Us',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 24,),
                    TextFormField(
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: (String? value){
                        String inputText = value ?? '';
                        if(EmailValidator.validate(inputText) == false ){
                          return 'Enter valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24,),
                    TextFormField(
                      controller: _firstnameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Enter First Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24,),
                    TextFormField(
                      controller: _lastnameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Enter Last Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24,),
                    TextFormField(
                      controller: _phonenumberController,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,

                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Enter Phone Number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (String? value){
                        if((value?.length ?? 0 ) <= 6){
                          return 'Enter Password more than 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Visibility(
                      visible: _signUpInProgress == false,
                      replacement: Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: FilledButton(onPressed: _onTapSubmitButton,
                          child: Icon(Icons.arrow_circle_right_outlined,size: 20,)
                      ),
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
  void _onTapSubmitButton(){
    if(_formKey.currentState!.validate()){
      _signUp();
    }
  }
  void _onTapLoginButton(){
    Navigator.pushNamedAndRemoveUntil(context,
        LoginScreen.name,(Prediacte)=>false,);
  }
  Future<void> _signUp() async {
    _signUpInProgress=true;
    setState(() {
    });
    Map<String,dynamic> requestBody={
      "email":_emailController.text.trim(),
      "firstName":_firstnameController.text.trim(),
      "lastName":_lastnameController.text.trim(),
      "mobile":_phonenumberController.text.trim(),
      "password":_passwordController.text
    };
    final ApiResponse response =await ApiCaller.postRequest(
      url: Urls.registrationUrl,
      body: requestBody
    );
    _signUpInProgress =false;
    setState(() {
    });
    if(response.isSuccess){
      _clearTextFields();
      showSnackbarMessage(context, 'Registration success! Please login.');
    } else{
      showSnackbarMessage(context, response.errorMessage!);
    }

  }
  void _clearTextFields(){
    _emailController.clear();
    _passwordController.clear();
    _firstnameController.clear();
    _lastnameController.clear();
    _phonenumberController.clear();
  }

  dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _phonenumberController.dispose();
    super.dispose();
  }
}
