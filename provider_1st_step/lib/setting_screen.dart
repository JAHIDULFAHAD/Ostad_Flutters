import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_1st_step/theme_controller.dart';

import 'counter_controller.dart';
import 'counter_controller_inherited_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting Screen"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterController>(
                builder: (context, counterController, child) {
                  return Text(counterController.count.toString(), style: TextStyle(fontSize: 30));
                }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: context.read<CounterController>().increment,
                 icon: Icon(Icons.add, size: 30)),
                SizedBox(width: 20),
                IconButton(
                  onPressed: context.read<CounterController>().decrement,
                  icon: Icon(Icons.remove, size: 30),
                ),
              ],
            ),
            SizedBox(height: 20),
            IconButton(onPressed: context.read<ThemeController>().toggleThemeMode,
                icon: Icon(Icons.dark_mode, size: 30))
          ],
        ),
      ),
    );
  }
}
