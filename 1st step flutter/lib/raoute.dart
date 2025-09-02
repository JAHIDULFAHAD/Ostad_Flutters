import 'package:flutter/material.dart';
import 'package:ostad_flutter/assignment.dart';

import 'drawer_tabbar.dart';

class Raoute extends StatelessWidget {
  const Raoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Raoute"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, PageRouteBuilder(
                  pageBuilder:(context,animation,secondaryAnimation)=>Assignment(),
                transitionsBuilder: (context,animation,secondaryAnimation,child){
                    const begin= Offset(5.0,0);
                    const end =Offset.zero;
                    const curve =Curves.ease;

                    var tween=Tween(begin: begin,end: end).chain(CurveTween(curve: curve));
                    return SlideTransition(
                      position: animation.drive(tween),child: child,);
                }
              ) );
            }, child: Text("Tour",style: Theme.of(context).textTheme.headlineMedium)),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/fb');
            }, child: Text("Facebook",style: Theme.of(context).textTheme.headlineMedium)),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/input');
            }, child:Text("User Input",style: Theme.of(context).textTheme.headlineMedium)),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DrawerTabbar()));
            }, child: Text("Drawer",style: Theme.of(context).textTheme.headlineMedium))
          ],
        ),
      ),
    );
  }
}
