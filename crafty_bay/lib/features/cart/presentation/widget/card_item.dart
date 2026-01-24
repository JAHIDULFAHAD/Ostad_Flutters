import 'package:crafty_bay/features/cart/data/models/cart_item_model.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/constants.dart';
import 'inc_dec_button.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: AppColors.themeColor.withAlpha(50),
      color: Colors.white,
      child: Row(
        spacing: 4,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Image.network(
              cartItemModel.image,
              width: 80,
              height: 80,
            )
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItemModel.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextTheme.of(context).bodyLarge?.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "Color: ${cartItemModel.color} Size: ${cartItemModel.size}",
                            style: TextTheme.of(
                              context,
                            ).bodySmall?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete, color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${Constants.takaSign}${cartItemModel.price}',
                      style: TextTheme.of(context).bodyLarge?.copyWith(
                        color: AppColors.themeColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IncDecButton(
                        maxValue:cartItemModel
                            ?.quantity ??
                            20,
                        onChange: (int value) {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
