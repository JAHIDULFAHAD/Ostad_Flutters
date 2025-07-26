import 'package:flutter/material.dart';
import 'package:ostad_flutter/list_view.dart';

class FacebookLogin extends StatelessWidget {
  const FacebookLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey=GlobalKey<FormState>();
    TextEditingController NumberController=TextEditingController();
    TextEditingController PasswordController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook Login",
        style:TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.tealAccent
        ) ,),
        centerTitle: true,
        backgroundColor: Colors.blue
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
                width: 200,
                "https://static.vecteezy.com/system/resources/previews/017/221/797/original/facebook-logo-transparent-background-free-png.png"),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  controller: NumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Mobile Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value){
                    if(value==null ||value.isEmpty){
                      return 'Please Enter your Mobile Number';
                    }else if(value.length!=11){
                      return 'Please Enter Valid Mobile Number';
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: PasswordController,
                  decoration:InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ) ,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return "Please Enter Password";
                    }else if(value.length<6){
                      return "Please Enter Valid Password";
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 420,
                    child: ElevatedButton(style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                    ),onPressed: (){
                      if(_formKey.currentState!.validate()){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> list(number: NumberController.text)));
                      }
                    }, child:Text("Login")))
              ],
            ),
          ),
          ),
        ],
      ),
    );
  }
}
