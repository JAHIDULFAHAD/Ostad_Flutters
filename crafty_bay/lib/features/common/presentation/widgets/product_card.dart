import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/constants.dart';
import '../../../product/presentation/screens/product_details_screen.dart';
import 'favourite_button.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,ProductDetailsScreen.name);
      },
      child: SizedBox(
        width: 150,
        child: Card(
          elevation: 3,
          shadowColor: AppColors.themeColor.withAlpha(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: Colors.white,
          child: Column(
              children: [
                Container(
                  height: 90,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      color: AppColors.themeColor.withAlpha(30),
                      image: DecorationImage(image: AssetImage(AssetPaths.dammyImageJpg),)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('Nike Shoe RG3434 - New Arrival',maxLines: 1,style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${Constants.takaSign} 234",style: TextStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                          Wrap(
                            children: [
                              Icon(Icons.star,size: 20,color: Colors.amber,),
                              Text('4.3')
                            ],
                          ),
                          FavouriteButton()
                        ],
                      ),
                    ],
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}

