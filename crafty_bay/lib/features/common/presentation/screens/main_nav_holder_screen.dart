import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/home/presentation/providers/home_slider_provider.dart';
import 'package:crafty_bay/features/wish_list/presentation/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/app_colors.dart';
import '../../../auth/presentation/providers/auth_controller.dart';
import '../../../auth/presentation/screens/sign_in_screen.dart';
import '../../../cart/presentation/screens/cart_list_screen.dart';
import '../../../category/presentation/provider/category_list_provider.dart';
import '../../../category/presentation/screens/category_list_screen.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../provider/main_nav_container_provider.dart';
class MainNavHolderScreen extends StatefulWidget {
  const MainNavHolderScreen({super.key});

  static const String name = '/main-nav-holder';

  @override
  State<MainNavHolderScreen> createState() => _MainNavHolderScreenState();
}

class _MainNavHolderScreenState extends State<MainNavHolderScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryListProvider>().getCategoriesList();
      context.read<HomeSliderProvider>().getHomeSlider();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavContainerProvider>(
      builder: (context, mainNavContainerProvider, _) {
        return Scaffold(
          body: _screens[mainNavContainerProvider.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: AppColors.themeColor,
            currentIndex: mainNavContainerProvider.selectedIndex,
            onTap:(int index) async {
              if(index == 2 || index == 3){
                if(await AuthController.isAlreadyLoggedIn() == false){
                  Navigator.pushNamed(context, SignInScreen.name);
                  return;
                }
            }
              mainNavContainerProvider.changeItem(index);
            },
            showSelectedLabels: true,
            items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: context.localization.home),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard_customize), label: context.localization.category),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: context.localization.carts),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_rounded), label: context.localization.wish_list),
          ],),
        );
      }
    );
  }
}
