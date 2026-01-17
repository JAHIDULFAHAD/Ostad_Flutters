import 'package:crafty_bay/features/common/presentation/widgets/product_card.dart';
import 'package:flutter/material.dart';
class ProductListByCategoryScreen extends StatefulWidget {
  const ProductListByCategoryScreen({super.key});
  static const String name = '/product_list_by_category';

  @override
  State<ProductListByCategoryScreen> createState() => _ProductListByCategoryScreenState();
}

class _ProductListByCategoryScreenState extends State<ProductListByCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electronic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 8,
          ),
          itemCount: 10,
          itemBuilder: (context,index) {
            return FittedBox(child: ProductCard());
          }
        ),
      ),
    );
  }
}
