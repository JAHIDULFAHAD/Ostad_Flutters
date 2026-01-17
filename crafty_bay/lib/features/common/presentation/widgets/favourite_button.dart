import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      color: AppColors.themeColor,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(Icons.favorite_outline,size: 18,color: Colors.white,),
      ),
    );
  }
}