import 'package:flutter/material.dart';

class UserInput extends StatelessWidget {
  const UserInput({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController PhoneController=TextEditingController();
    TextEditingController PasswordController=TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade200,
        title: Text('Login Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 350,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.tealAccent,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login',style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple
              ),),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: PhoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Phone Number',
                    labelText: 'Phone Number',
                    hintStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 24,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.add_call),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: PasswordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 24,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye)
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[ Padding(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)
                    )
                  ),onPressed: (){
                    if(PhoneController.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter phone number'))
                      );
                    }else if(PhoneController.text.length<11){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter Valid phone number'))
                      );
                    }else if(PasswordController.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter Password'))
                      );
                    }else if(PasswordController.text.length<8){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter Valid Password'))
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(PhoneController.text))
                      );

                    }
                  }, child: Text('Login',style: TextStyle(
                    fontSize: 20
                  ),)),
                ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(style:ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigoAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        )
                    ),onPressed: (){
                      PhoneController.clear();
                      PasswordController.clear();
                    }, child: Text('Clear Login',style: TextStyle(
                        fontSize: 20,
                      color: Colors.lightGreenAccent
                    ),)),
                  ),
                ]
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
