import 'package:flutter/material.dart';
import 'package:magd_soft_task/models/category_model.dart';
import 'package:magd_soft_task/models/products_model.dart';
import 'package:magd_soft_task/modules/help/help_screen.dart';
import 'package:magd_soft_task/modules/home/home_screen.dart';
import 'package:magd_soft_task/modules/login/login_screen.dart';
import 'package:magd_soft_task/modules/product_details/product_details_screen.dart';
import 'package:magd_soft_task/modules/splash/splash_screen.dart';
import 'package:magd_soft_task/modules/verify_phone/verify_phone_screen.dart';

import '../modules/category/category_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return SplashScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case VerifyPhoneScreen.routeName:
        return VerifyPhoneScreen.route(phone: settings.arguments as String);
      case HelpScreen.routeName:
        return HelpScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CategoryScreen.routeName:
        return CategoryScreen.route(category: settings.arguments as Category);
      case ProductDetailsScreen.routeName:
        return ProductDetailsScreen.route(model: settings.arguments as ProductsModel);

      default:
    }
    return null;
  }
}
