import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/screens/user_profile_screen.dart';
import 'package:crafty_bay/features/common/presentation/provider/main_nav_container_provider.dart';
import 'package:crafty_bay/features/common/presentation/widgets/center_circular_progress.dart';
import 'package:crafty_bay/features/home/presentation/providers/home_slider_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../app/constants.dart';
import '../../../auth/presentation/providers/auth_controller.dart';
import '../../../auth/presentation/screens/setting_screen.dart';
import '../../../auth/presentation/screens/sign_in_screen.dart';
import '../../../category/presentation/provider/category_list_provider.dart';
import '../../../common/presentation/widgets/category_card.dart';
import '../../../common/presentation/widgets/product_card.dart';
import '../../../common/presentation/widgets/snack_bar_message.dart';
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
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            spacing: 16,
            children: [
              ProductSearchField(),
              Consumer<HomeSliderProvider>(
                builder: (context, homeSliderProvider, _) {
                  if (homeSliderProvider.getHomeSliderInProgress) {
                    return SizedBox(
                        height: 200,
                        child: CenterCircularProgress());
                  }
                  return HomeCarouselSlider(sliders: homeSliderProvider.homeSliderList);
                }
              ),
              SectionHeader(
                title: context.localization.categories,
                onTapSeeAll: () {
                  context.read<MainNavContainerProvider>().changeToCategory();
                },
              ),
              _buildCategoryList(),
              SectionHeader(
                title: context.localization.popular,
                onTapSeeAll: () {},
              ),
              _buildPopularProductList(),
              SectionHeader(
                title: context.localization.special,
                onTapSeeAll: () {},
              ),
              _buildPopularProductList(),
              SectionHeader(
                title: context.localization.new_item,
                onTapSeeAll: () {},
              ),
              _buildPopularProductList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularProductList() {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          // return ProductCard();
        },
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 85,
      child: Consumer<CategoryListProvider>(
        builder: (context, categoryListProvider, _) {
          if (categoryListProvider.isCategoryLoading) {
            return CenterCircularProgress();
          }
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categoryListProvider.categories.length > 10
                ? 10
                : categoryListProvider.categories.length,
            itemBuilder: (context, index) {
              return CategoryCard(
                categoryModel: categoryListProvider.categories[index],
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 8),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        spacing: 4,
        children: [
          SvgPicture.asset(AssetPaths.logoNavSvg),
          Spacer(),
          CircleIconButton(
            icon: Icons.person,
            onTap: () {
              if(AuthController.userModel == null){
                showSnackBarMessage(context, 'Please login first');
                Navigator.pushNamed(context, SignInScreen.name);
                return;
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfileScreen()),
              );
            },
          ),
          CircleIconButton(icon: Icons.settings, onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingScreen()),
            );
          }),
          CircleIconButton(icon: Icons.notifications, onTap: () {}),
        ],
      ),
      centerTitle: true,
    );
  }
}
