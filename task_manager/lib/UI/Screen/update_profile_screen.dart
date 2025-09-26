import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager/Ui/Widgets/screen_background.dart';
import 'package:task_manager/Ui/Widgets/tm_app_bar.dart';

import '../Widgets/photo_picker_field.dart';
class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});
  static const String name = '/updateprofile';

  @override
  State<UpdateProfileScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(
        fromUpdateProfile: true,
      ),
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
                    Text('Update Profile',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 24,),
                    PhotoPickerField(
                      onTap: _pickImage,
                      selectedPhoto: _selectedImage,
                    ),
                    SizedBox(height: 24,),
                    TextFormField(
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    SizedBox(height: 24,),
                    TextFormField(
                      controller: _firstnameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                      ),
                    ),
                    SizedBox(height: 24,),
                    TextFormField(
                      controller: _lastnameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                      ),
                    ),
                    SizedBox(height: 24,),
                    TextFormField(
                      controller: _phonenumberController,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FilledButton(onPressed: (){},
                        child: Icon(Icons.arrow_circle_right_outlined,size: 20,)
                    ),
                    SizedBox(
                      height: 36,
                    ),

                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _pickImage() async {
    XFile? pickedImage= await _imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      _selectedImage=pickedImage;
      setState(() {});
    }
  }
  @override
  dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _phonenumberController.dispose();
    super.dispose();
  }

}


