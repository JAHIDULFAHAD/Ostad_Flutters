import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/cart/presentation/provider/cart_item_provider.dart';
import 'package:crafty_bay/features/cart/presentation/widget/inc_dec_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/asset_paths.dart';
import '../../../../app/constants.dart';
import '../../../common/presentation/provider/main_nav_container_provider.dart';
import '../../data/models/cart_item_model.dart';
import '../widget/card_item.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  final CartListProvider _cartItemProvider = CartListProvider();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cartItemProvider.getCartList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _cartItemProvider,
      child: PopScope(
        onPopInvokedWithResult: (_, __) {
          context.read<MainNavContainerProvider>().backToHome();
        },
        canPop: false,
        child: Scaffold(
          appBar: AppBar(title: Text(context.localization.carts)),
          body: Consumer<CartListProvider>(
            builder: (context, cartItemProvider, _) {
              if (cartItemProvider.inProgress) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.builder(
                        itemCount: cartItemProvider.cartList.length,
                        itemBuilder: (context, index) {
                          return CardItem(
                            cartItemModel: cartItemProvider.cartList[index],
                          );
                        },
                      ),
                    ),
                  ),
                  _buildTotalPriceAndCheckoutSection(
                    context,
                    cartItemProvider.totalPrice,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Container _buildTotalPriceAndCheckoutSection(
    BuildContext context,
    int total,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withAlpha(40),
        borderRadius: const BorderRadius.only(
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
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                '${Constants.takaSign}$total',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: FilledButton(
              onPressed: () {},
              child: Text(context.localization.checkout),
            ),
          ),
        ],
      ),
    );
  }
}
