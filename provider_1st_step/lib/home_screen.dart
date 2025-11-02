import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_1st_step/counter_controller.dart';
import 'package:provider_1st_step/setting_screen.dart';

import 'counter_controller_inherited_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterController>(
              builder: (context, controller, child) {
                 return Text(controller.count.toString(), style: TextStyle(fontSize: 30));
              }

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: context.read<CounterController>().increment, icon: Icon(Icons.add, size: 30)),
                SizedBox(width: 20),
                IconButton(
                  onPressed: context.read<CounterController>().decrement,
                  icon: Icon(Icons.remove, size: 30),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
            },
            child: Icon(Icons.settings),
          ),
        ]
      ),
    );
    
  }
}
