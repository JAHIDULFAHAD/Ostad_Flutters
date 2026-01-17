import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

import '../../../common/presentation/widgets/language_selector.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.localization.hello),
            LanguageSelector(),
          ],
        )
      ),
    );
  }
}
