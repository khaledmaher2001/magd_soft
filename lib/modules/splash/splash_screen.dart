import 'dart:async';
import 'package:flutter/material.dart';
import 'package:magd_soft_task/shared/styles/colors.dart';
import '../../shared/network/local/cache_helper.dart';


class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  static const String routeName = "splashScreen";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(
        name: routeName,
      ),
      builder: (_) => SplashScreen(),
    );
  }

  var isLogin = CacheHelper.getData(key: "status");

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushNamedAndRemoveUntil(context,
            isLogin == null ? "loginScreen" : "homeScreen", (route) => false));

    // Timer(const Duration(seconds: 3),()=>Navigator.pushNamed(context, "loginScreen"));

    return Scaffold(
      backgroundColor: defaultColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/Group 40.png",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/images/logo.png",
              width: width * 0.65,
              height: height * 0.25,
            ),
          ],
        ),
      ),
    );
  }
}
