import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New App'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body:SingleChildScrollView(
        scrollDirection:Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children:[
          Text('Jahidul',
            style:
            TextStyle(fontSize: 50,color: Colors.grey,fontWeight:FontWeight.bold ) ,),
            Text('Haque',
              style:
              TextStyle(fontSize: 50,color: Colors.grey,fontWeight:FontWeight.bold ) ,),
            Text('Fahad',
              style:
              TextStyle(fontSize: 50,
                  color: Colors.grey,
                  fontWeight:FontWeight.bold ) ,
            ),
            Text('text',
              style:
              TextStyle(fontSize: 50,
                  color: Colors.grey,
                  fontWeight:FontWeight.bold ) ,
            ),
            Text('text',
              style:
              TextStyle(fontSize: 50,
                  color: Colors.grey,
                  fontWeight:FontWeight.bold ) ,
            ),
            Text('text',
              style:
              TextStyle(fontSize: 50,
                  color: Colors.grey,
                  fontWeight:FontWeight.bold ) ,
            ),
            Text('text',
              style:
              TextStyle(fontSize: 50,
                  color: Colors.grey,
                  fontWeight:FontWeight.bold ) ,
            ),
            Text('text',
              style:
              TextStyle(fontSize: 50,
                  color: Colors.grey,
                  fontWeight:FontWeight.bold ) ,
            ),
            Text('text',
              style:
              TextStyle(fontSize: 50,
                  color: Colors.grey,
                  fontWeight:FontWeight.bold ) ,
            ),
            Text('text',
              style:
              TextStyle(fontSize: 50,
                  color: Colors.grey,
                  fontWeight:FontWeight.bold ) ,
            ),
            Text('text',
              style:
              TextStyle(fontSize: 50,
                  color: Colors.grey,
                  fontWeight:FontWeight.bold ) ,
            ), Text('text',
              style:
              TextStyle(fontSize: 50,
                  color: Colors.grey,
                  fontWeight:FontWeight.bold ) ,
            ),
            Text('text',
              style:
              TextStyle(fontSize: 50,
                  color: Colors.grey,
                  fontWeight:FontWeight.bold ) ,
            ),
            Text('text',
              style:
              TextStyle(fontSize: 50,
                  color: Colors.grey,
                  fontWeight:FontWeight.bold ) ,
            ),
        
            Row(children: [
              Text('text',
                style:
                TextStyle(fontSize: 50,
                    color: Colors.deepOrange,
                    fontWeight:FontWeight.bold ) ,
              ),
              Text('text',
                style:
                TextStyle(fontSize: 50,
                    color: Colors.grey,
                    fontWeight:FontWeight.bold ) ,
              ),
              Text('text',
                style:
                TextStyle(fontSize: 50,
                    color: Colors.grey,
                    fontWeight:FontWeight.bold ) ,
              ),
        
            ],)
          ]
        ),
      ),
    );
  }
}
