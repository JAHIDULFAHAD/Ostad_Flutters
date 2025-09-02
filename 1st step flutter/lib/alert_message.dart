import 'package:flutter/material.dart';

class AlertMessage extends StatelessWidget {
  const AlertMessage({super.key});

  @override
  Widget build(BuildContext context) {
    Size ScreenSize=MediaQuery.of(context).size;
    void ShowAlertDialog(){
      showDialog(context: context,barrierDismissible: false,builder: (context)=>AlertDialog(
        title: Text("Confirm delete"),
        content: Text("Sure You are Delete This"),
        actions: [
          TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancel")),
          ElevatedButton(onPressed: (){}, child: Text("Delete"))
        ],
      ));
    }
    void ShowIconAlert(){
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text("Installation block"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Icons.warning,color: Colors.red,),
                Text("Warning")
              ],
            ),
            Text("gbsbhfhjfjfuhreoiretuireiu ejrujririror jrejiuritrkiorio")
          ],
        ),
        actions: [
          TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Ok"))
        ],
      ));
    }
    void ShowSimpleDialog(){
      showDialog(context: context, builder: (context)=>SimpleDialog(
        title: Text("Simple Dialog"),
        children: [
          SimpleDialogOption(
            child: Text("Option-1"),
          ),
          SimpleDialogOption(
            child: Text("Option-2"),
          )
        ],
      ));
    }
    void ShowBottomDialog(){
      showModalBottomSheet(context: context, builder: (context)=>Container(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Chose Option" ,style: TextStyle(
          fontSize: 18,
        ),),
            ListTile(
              title: Text('Option-1'),
              onTap: (){},
            ),
            ListTile(
              title: Text('Option-2'),
              onTap: (){},
            ),
            ListTile(
              title: Text('Option-3'),
              onTap: (){},
            ),
            ListTile(
              title: Text('Option-4'),
              onTap: (){},
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(onPressed: (){Navigator.pop(context);}, child:Text('Save') ),
            )
          ],
        )
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert"),
        centerTitle:true,
        backgroundColor: Colors.greenAccent,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.greenAccent,
              width: ScreenSize.width*0.5,
              height:ScreenSize.height*0.3,
            ),
            ElevatedButton(style:ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreenAccent,
            ) ,onPressed: (){ ShowAlertDialog();}, child: Text("Submit")),
            ElevatedButton(style:ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreenAccent,
            ) ,onPressed: (){ ShowIconAlert();}, child: Text("Submit Icon")),
            ElevatedButton(style:ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreenAccent,
            ) ,onPressed: (){ ShowSimpleDialog();}, child: Text("Simple Dailog")),
            ElevatedButton(style:ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreenAccent,
            ) ,onPressed: (){ ShowBottomDialog();}, child: Text("Buttom Dailog")),
          ],
        ),
      ),
    );
  }
}
