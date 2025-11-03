import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_1st_step/home_screen.dart';
import 'package:provider_1st_step/theme_controller.dart';

import 'counter_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ThemeController(),),
        ChangeNotifierProvider(create: (_)=>CounterController(),),
      ],
      child: Consumer<ThemeController>(
        builder: (context, controller, child) {
          return MaterialApp(
            title: 'Provider Counter',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: HomeScreen(),
            darkTheme: ThemeData(brightness: Brightness.dark),
            themeMode: controller.themeMode,
          );
        }
      ),
    );
  }
}

