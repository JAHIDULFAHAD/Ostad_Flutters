import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent.withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent[100],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(style:ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent.shade200,
                foregroundColor: Colors.blueAccent.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)
                )
              ),onPressed: (){}, child:Text('Submit',style: TextStyle(
                fontSize: 30
              ),) ),
            ),
            SizedBox(
              height: 30,
            ),
            OutlinedButton(style:OutlinedButton.styleFrom(
              backgroundColor: Colors.blue.shade200,
              foregroundColor: Colors.blueAccent.shade400,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              )
            ),onPressed: (){}, child: Text('Done',style: TextStyle(
              fontSize: 40
            ),)),
            SizedBox(
              height: 30,
            ),
            TextButton(onPressed: (){}, child: Text('Click',style: TextStyle(
              fontSize: 50,
              color: Colors.pink.shade300,
            ),)),
            IconButton(onPressed: (){}, icon: Icon(Icons.add_call,
            size: 100,
            color: Colors.blueGrey.shade300,)),
            GestureDetector(onTap:(){
              print('Nahid');
            },child:
            Text('Oh No',style: TextStyle(
              fontSize: 100,
            ),)),
            Padding(
              padding: EdgeInsets.only(left:10,top: 5,right:10,bottom:10),
              child: Text('Janina',style: TextStyle(
                fontSize: 50
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
