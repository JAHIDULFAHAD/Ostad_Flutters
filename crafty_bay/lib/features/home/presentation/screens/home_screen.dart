import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/common/presentation/provider/main_nav_container_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/constants.dart';
import '../../../auth/presentation/screens/setting_screen.dart';
import '../../../common/presentation/widgets/category_card.dart';
import '../../../common/presentation/widgets/product_card.dart';
import '../widget/circle_icon_button.dart';
import '../widget/product_search_field.dart';
import '../widget/section_header.dart';
import '../widget/home_carousel_slider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child:Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            spacing: 16,
            children: [
              ProductSearchField(),
              HomeCarouselSlider(),
              SectionHeader(title: context.localization.categories, onTapSeeAll: () {
                context.read<MainNavContainerProvider>().changeToCategory();
              },),
              _buildCategoryList(),
              SectionHeader(title: context.localization.popular, onTapSeeAll: () {
              },),
              _buildPopularProductList(),
              SectionHeader(title: context.localization.special, onTapSeeAll: () {
              },),
              _buildPopularProductList(),
              SectionHeader(title: context.localization.new_item, onTapSeeAll: () {
              },),
              _buildPopularProductList(),
            ]
          ))
      ),
    );
  }

  Widget _buildPopularProductList() {
    return SizedBox(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index){
                return ProductCard();
              },),
            );
  }

  Widget _buildCategoryList() {
    return SizedBox(
              height: 85,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                  itemBuilder: (context, index){
                return CategoryCard();
              },
                separatorBuilder: (context, index) => SizedBox(width: 8,),),
            );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        spacing: 4,
        children: [
          SvgPicture.asset(AssetPaths.logoNavSvg),
          Spacer(),
          CircleIconButton(icon: Icons.person, onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen()));
          },),
          CircleIconButton(icon: Icons.call, onTap: () {  },),
          CircleIconButton(icon: Icons.notifications, onTap: () {  },),
        ],
      ),
      centerTitle: true,
    );
  }
}










