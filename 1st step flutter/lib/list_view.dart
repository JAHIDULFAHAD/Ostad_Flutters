import 'package:flutter/material.dart';
class list extends StatefulWidget {
  final number;
  const list({super.key,required this.number});

  @override
  State<list> createState() => _listState();
}

class _listState extends State<list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Mobile Number"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              leading: Icon(Icons.add_call),
              trailing: Icon(Icons.delete_forever_sharp),
              title: Text('Fahad'),
              subtitle: Text(widget.number),
            ),
          );
        },),
    );
  }
}
