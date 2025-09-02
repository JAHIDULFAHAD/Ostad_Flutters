import 'package:flutter/material.dart';

class GridViews extends StatelessWidget {
  const GridViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      // body: GridView.count(
      //   crossAxisCount: 4,
      //   crossAxisSpacing: 5,
      //   mainAxisSpacing: 10,
      //   children:
      //     List.generate(30, (index){
      //       return Card(
      //         elevation: 15,
      //         color: Colors.greenAccent,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //             children:[
      //               Icon(Icons.accessibility_new_sharp),
      //               Text('Click')
      //       ]),
      //       );
      //     }),
      // ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: 20,
          itemBuilder: (context,index){
            return Card(
              color: Colors.blueGrey,

              child: Center(child: Text(index.toString())),
            );
          }
      ),
    );
  }
}
