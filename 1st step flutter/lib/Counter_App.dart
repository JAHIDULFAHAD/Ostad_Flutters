import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  CounterApp({super.key}){
    print('const CounterApp');
  }

  @override
  State<CounterApp> createState(){
    print('createState');
    return _CounterAppState();
  }
}

class _CounterAppState extends State<CounterApp> {
  int count=0;
  _CounterAppState(){
    print('const _CounterAppState');
  }
  @override
  void initState() {
    super.initState();
    print('initState');
  }
  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }
  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }
  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }
  Pushed(){
    print('Pushed');
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(count.toString(),style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange
            ),),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    count++;
                    print(count);
                  });
                }, child: Text('+',style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                ),)),
                ElevatedButton(onPressed: (){
                  setState(() {
                    count--;
                    print(count);
                  });
                }, child: Text('-',style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                ),)),
                ElevatedButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DrawerButton()));
                }, child: Text("buton"))
              ],
            )
          ]
      ),
    );
  }
}


