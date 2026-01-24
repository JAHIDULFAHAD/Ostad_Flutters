import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../data/models/slider_model.dart';
class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key, required this.sliders});
  final List<SliderModel> sliders;

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 200.0,
          viewportFraction: 1,
          onPageChanged: (index, reason){
            _selectedIndex.value = index;
          },
            autoPlay: true
          ),
          items: widget.sliders.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(image: NetworkImage(i.photoUrl),fit: BoxFit.cover)
                    ),
                    alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 8,),
        ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i=0;i<5;i++)
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
        )
      ],
    );
  }
}
