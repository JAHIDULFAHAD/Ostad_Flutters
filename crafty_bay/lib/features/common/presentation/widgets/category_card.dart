import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../product/presentation/screens/product_list_by_category_screen.dart';
class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,ProductListByCategoryScreen.name);
      },
      child: Column(
        children: [
          Card(
              elevation: 0,
              color: AppColors.themeColor.withAlpha(50),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.computer,size: 32,color: AppColors.themeColor,),
              )
          ),
          Text('Computer',style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.themeColor,
              letterSpacing: .6
          ),),
        ],
      ),
    );
  }
}