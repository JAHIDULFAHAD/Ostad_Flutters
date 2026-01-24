import 'package:crafty_bay/features/common/presentation/widgets/center_circular_progress.dart';
import 'package:crafty_bay/features/common/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../category/data/models/category_model.dart';
import '../provider/product_list_by_category_provider.dart';

class ProductListByCategoryScreen extends StatefulWidget {
  const ProductListByCategoryScreen({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  static const String name = '/product_list_by_category';

  @override
  State<ProductListByCategoryScreen> createState() =>
      _ProductListByCategoryScreenState();
}

class _ProductListByCategoryScreenState
    extends State<ProductListByCategoryScreen> {
  final ScrollController _scrollController = ScrollController();
  final ProductListByCategoryProvider _productListByCategoryProvider =
      ProductListByCategoryProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _productListByCategoryProvider.loadIntialProductList(
        widget.categoryModel.id,
      );
      _scrollController.addListener(loadMoreProduct);
    });
  }

  void loadMoreProduct() {
    if (_productListByCategoryProvider.isMoreProductLoading) {
      return;
    }
    if (_scrollController.position.extentBefore < 300) {
      _productListByCategoryProvider.getProductList(widget.categoryModel.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryModel.title)),
      body: ChangeNotifierProvider(
        create: (context) => _productListByCategoryProvider,
        child: Consumer<ProductListByCategoryProvider>(
          builder: (context, _, __) {
            if (_productListByCategoryProvider.isProductLoading) {
              return CenterCircularProgress();
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 8,
                ),
                itemCount: _productListByCategoryProvider.productList.length,
                itemBuilder: (context, index) {
                  final product =
                      _productListByCategoryProvider.productList[index];
                  return FittedBox(child: ProductCard(productModel: product));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
