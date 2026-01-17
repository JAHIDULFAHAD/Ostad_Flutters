import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/product/presentation/widgets/color_picker.dart';
import 'package:crafty_bay/features/product/presentation/widgets/product_image_slider.dart';
import 'package:crafty_bay/features/product/presentation/widgets/size_picker.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';
import '../../../cart/presentation/widget/inc_dec_button.dart';
import '../../../common/presentation/widgets/favourite_button.dart';
import '../../../common/presentation/widgets/rating_view.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});
  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: Text(context.localization.product_details)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageSlider(),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "Nike Shoe A34 - All New Edition 2026",
                                style: TextTheme.of(context).titleMedium,
                              ),
                            ),
                            IncDecButton(onChange: (newValue) {}),
                          ],
                        ),
                        Row(
                          children: [
                            RatingView(),
                            TextButton(
                              onPressed: () {},
                              child: Text(context.localization.reviews),
                            ),
                            FavouriteButton(),
                          ],
                        ),
                        Text(context.localization.color, style: TextTheme.of(context).titleMedium),
                        SizedBox(height: 8),
                        ColorPicker(
                          colors: ['black', 'white'],
                          onChange: (selectedColor) {
                          },
                        ),
                        SizedBox(height: 16),
                        Text(context.localization.size, style: TextTheme.of(context).titleMedium),
                        SizedBox(height: 8),
                        SizePicker(sizes: ['42', '43', '44'], onChange: (selectedSize) {
                        },),
                        SizedBox(height: 16),
                        Text(context.localization.description, style: TextTheme.of(context).titleMedium),
                        SizedBox(height: 8),
                        Text("This is a description of the product. It can be as long as you want, and it can even span multiple lines.",style: TextStyle(
                          color: Colors.grey,
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCartSection(context),
        ],
      ),
    );
  }

  Container _buildPriceAndAddToCartSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withAlpha(40),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.localization.price, style: TextTheme.of(context).bodyLarge),
              Text(
                '${Constants.takaSign}500',
                style: TextTheme.of(context).titleLarge?.copyWith(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: FilledButton(onPressed: () {}, child: Text(context.localization.add_to_cart)),
          ),
        ],
      ),
    );
  }
}
