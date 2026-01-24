import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../category/data/models/category_model.dart';
import '../../../product/presentation/screens/product_list_by_category_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListByCategoryScreen.name,arguments: categoryModel);
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.themeColor.withAlpha(50),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.network(
                categoryModel.icon,
                width: 30,
                height: 30,
                errorBuilder: (_, __, ___) => Icon(Icons.error,size: 28,color: Colors.grey,),
              ),
            ),
          ),
          Text(
            categoryModel.title,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.themeColor,
              letterSpacing: .6,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
