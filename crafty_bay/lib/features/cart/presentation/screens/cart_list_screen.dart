import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/cart/presentation/widget/inc_dec_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/asset_paths.dart';
import '../../../../app/constants.dart';
import '../../../common/presentation/provider/main_nav_container_provider.dart';
import '../widget/card_item.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult:(_,__){
        context.read<MainNavContainerProvider>().backToHome();
      },
      canPop: false,
      child: Scaffold(
        appBar: AppBar(title: Text(context.localization.carts)),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return CardItem();
                  },
                ),
              ),
            ),
            _buildTotalPriceAndCheckoutSection(context),
          ],
        ),
      ),
    );
  }

  Container _buildTotalPriceAndCheckoutSection(BuildContext context) {
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
                  Text(
                    context.localization.total_price,
                    style: TextTheme.of(context).bodyLarge,
                  ),
                  Text(
                    '${Constants.takaSign}500',
                    style: TextTheme.of(context).titleLarge?.copyWith(
                      color: AppColors.themeColor,
                      fontWeight: FontWeight.w600,
                    )
                  )
                ],
              ),
              SizedBox(
                  width: 120,
                  child: FilledButton(onPressed: (){}, child: Text(context.localization.checkout)))
            ],
          ),
        );
  }
}

