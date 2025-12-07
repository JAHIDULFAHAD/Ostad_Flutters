

import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MapApp());
}

class MapApp extends StatelessWidget {
  const MapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home_Screen(),
    );
  }
}
