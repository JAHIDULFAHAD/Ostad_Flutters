import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/provider/language_provider.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(context.localization.changeLanguage),
        DropdownMenu<String>(
          initialSelection: context.read<LanguageProvider>().currentLocale.languageCode,
          onSelected: (String? language) {
            context.read<LanguageProvider>().changeLocale(Locale(language!));
          },
          dropdownMenuEntries: [
            DropdownMenuEntry(value: 'en', label: 'English'),
            DropdownMenuEntry(value: 'bn', label: 'বাংলা'),
          ],
        ),
      ],
    );
  }
}
