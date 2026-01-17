import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:flutter/material.dart';
class ProductSearchField extends StatelessWidget {
  const ProductSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.grey.withAlpha(50),
        filled: true,
        hintText: context.localization.search,
        prefixIcon: Icon(Icons.search,color: Colors.grey,),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}