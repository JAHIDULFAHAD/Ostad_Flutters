import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/providers/auth_controller.dart';
import 'package:crafty_bay/features/common/presentation/widgets/center_circular_progress.dart';
import 'package:crafty_bay/features/product/presentation/provider/product_details_provider.dart';
import 'package:crafty_bay/features/product/presentation/widgets/color_picker.dart';
import 'package:crafty_bay/features/product/presentation/widgets/product_image_slider.dart';
import 'package:crafty_bay/features/product/presentation/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';
import '../../../auth/presentation/screens/sign_in_screen.dart';
import '../../../cart/presentation/widget/inc_dec_button.dart';
import '../../../common/presentation/provider/add_to_cart_provider.dart';
import '../../../common/presentation/widgets/favourite_button.dart';
import '../../../common/presentation/widgets/rating_view.dart';
import '../../../common/presentation/widgets/snack_bar_message.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  final String productId;
  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsPrvider _productDetailsPrvider = ProductDetailsPrvider();
  final AddToCartProvider _addToCartProvider = AddToCartProvider();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _productDetailsPrvider.getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.localization.product_details)),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => _addToCartProvider),
          ChangeNotifierProvider(create: (_) => _productDetailsPrvider),
        ],
        child: Consumer<ProductDetailsPrvider>(
          builder: (context, productDetailsPrvider, _) {
            if (productDetailsPrvider.isProductDetailsLoading) {
              return CenterCircularProgress();
            }
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductImageSlider(
                          imagesUrls:
                              productDetailsPrvider
                                  .productDetailsModel
                                  ?.photo ??
                              [],
                        ),
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
                                      _productDetailsPrvider
                                              .productDetailsModel
                                              ?.title ??
                                          '',
                                      style: TextTheme.of(context).titleMedium,
                                    ),
                                  ),
                                  IncDecButton(
                                      maxValue: _productDetailsPrvider
                                          .productDetailsModel
                                          ?.quantity ??
                                          20,
                                      onChange: (newValue) {}),
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
                              if (_productDetailsPrvider
                                      .productDetailsModel
                                      ?.colors
                                      .isNotEmpty ??
                                  false)
                                Text(
                                  context.localization.color,
                                  style: TextTheme.of(context).titleMedium,
                                ),
                              SizedBox(height: 8),
                              ColorPicker(
                                colors:
                                    _productDetailsPrvider
                                        .productDetailsModel
                                        ?.colors ??
                                    [],
                                onChange: (selectedColor) {},
                              ),
                              SizedBox(height: 16),
                              if (_productDetailsPrvider
                                      .productDetailsModel
                                      ?.sizes
                                      .isNotEmpty ??
                                  false)
                                Text(
                                  context.localization.size,
                                  style: TextTheme.of(context).titleMedium,
                                ),
                              SizedBox(height: 8),
                              SizePicker(
                                sizes:
                                    _productDetailsPrvider
                                        .productDetailsModel
                                        ?.sizes ??
                                    [],
                                onChange: (selectedSize) {},
                              ),
                              SizedBox(height: 16),
                              Text(
                                context.localization.description,
                                style: TextTheme.of(context).titleMedium,
                              ),
                              SizedBox(height: 8),
                              Text(
                                _productDetailsPrvider
                                        .productDetailsModel
                                        ?.description ??
                                    '',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildPriceAndAddToCartSection(context),
              ],
            );
          },
        ),
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
              Text(
                context.localization.price,
                style: TextTheme.of(context).bodyLarge,
              ),
              Text(
                '${Constants.takaSign}${_productDetailsPrvider.productDetailsModel?.price ?? ''}',
                style: TextTheme.of(context).titleLarge?.copyWith(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: Consumer<AddToCartProvider>(
              builder: (context, addToCartProvider, _) {
                if (addToCartProvider.isAddToCartInProgress) {
                  return CenterCircularProgress();
                }
                return FilledButton(
                  onPressed: _onTapAddToCartButton,
                  child: Text(context.localization.add_to_cart),
                );
              }
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onTapAddToCartButton() async {
    if(await AuthController.isAlreadyLoggedIn()){
      final bool isSuccess = await _addToCartProvider.addToCart(widget.productId);
      if (isSuccess) {
        showSnackBarMessage(context, "Product added to cart");
      } else {
        showSnackBarMessage(context, _addToCartProvider.errorMessage!);
      }
    } else {
      Navigator.pushNamed(context, SignInScreen.name);
    }
  }
}
