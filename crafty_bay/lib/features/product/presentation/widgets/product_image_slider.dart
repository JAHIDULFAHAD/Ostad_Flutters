import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key, required this.imagesUrls});
  final List<String> imagesUrls;

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 240.0,
              viewportFraction: 1,
              onPageChanged: (index, reason){
                _selectedIndex.value = index;
              },
              autoPlay: true
          ),
          items: widget.imagesUrls.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(50),
                      image: DecorationImage(
                        image: NetworkImage(i),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 8,),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _selectedIndex,
              builder: (context, value, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i=0;i<widget.imagesUrls.length;i++)
                      Container(
                          width: 12,
                          height: 12,
                          margin: EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                              color: i==value?AppColors.themeColor:null,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16)
                          )
                      )
                  ],
                );
              }
          ),
        )
      ],
    );
  }
}
