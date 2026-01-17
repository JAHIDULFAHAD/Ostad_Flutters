import 'package:crafty_bay/features/product/presentation/screens/product_list_by_category_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/sign_in_screen.dart';
import '../features/auth/presentation/screens/sign_up_screen.dart';
import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/auth/presentation/screens/verify_otp_screen.dart';
import '../features/common/presentation/screens/main_nav_holder_screen.dart';
import '../features/product/presentation/screens/product_details_screen.dart';

class AppRoutes{
  static Route<dynamic> route (RouteSettings settings){
    late Widget widget;
    if(settings.name == SplashScreen.name){
      widget = SplashScreen();
    } else if(settings.name == SignUpScreen.name){
      widget = SignUpScreen();
    } else if(settings.name == SignInScreen.name){
      widget = SignInScreen();
    } else if(settings.name == VerifyOtpScreen.name){
      widget = VerifyOtpScreen();
    } else if(settings.name == MainNavHolderScreen.name){
      widget = MainNavHolderScreen();
    } else if(settings.name == ProductListByCategoryScreen.name){
      widget = ProductListByCategoryScreen();
    } else if(settings.name == ProductDetailsScreen.name){
      widget = ProductDetailsScreen();
    }
    return MaterialPageRoute(builder: (ctx) => widget);
  }
}