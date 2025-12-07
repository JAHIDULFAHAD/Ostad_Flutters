import 'package:flutter/material.dart';
import 'package:maps/assingment_home_screen.dart';

void main() {
  runApp(const MapApp());
}

class MapApp extends StatelessWidget {
  const MapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AssingmentHomeScreen(),
    );
  }
}
