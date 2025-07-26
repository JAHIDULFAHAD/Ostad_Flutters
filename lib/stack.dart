import 'package:flutter/material.dart';
class Stacks extends StatelessWidget {
  const Stacks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.blueAccent,
              ),
              Positioned(
                  top:30,
                bottom: 30,
                left: 20,
                right: 20,
                child: Container(
                width: 200,
                height: 200,
                color: Colors.orange,
              ))
            ],
          ),
          SizedBox(height: 20,),
          Stack(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage("https://tse4.mm.bing.net/th/id/OIP.kRJlf2va5WvY60EQfAbXiAHaJh?rs=1&pid=ImgDetMain&o=7&rm=3"),

              ),
              
              Positioned(
                bottom: 5,
                  right: 20,
                  child: Container(
                width: 30,
                height: 20,
                    decoration: BoxDecoration(
                      color:Colors.green,
                      shape: BoxShape.circle,
                        border: Border.all(color: Colors.white,width: 3)
                    ),

              ))
            ],
          ),
          Stack(

            children: [
              Image.network("https://media.gettyimages.com/id/646044454/photo/dhaka-bangladesh.jpg?b=1&s=170667a&w=0&k=20&c=15-Fw788IO5ZyAXG3ToNaDJlL8p7BY0VUGAOUKcoNEI="),
              Positioned(
                bottom: 20,
                  left: 200,

                  child:
              Text("Bangladesh",style: TextStyle(
                color: Colors.blue,
                fontSize: 30
              ),))
            ],
          )
        ],
      ),
    );
  }
}
