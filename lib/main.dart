import 'package:flutter/material.dart';
import 'package:magd_soft_task/config/app_router.dart';
import 'package:magd_soft_task/modules/help/help_screen.dart';
import 'package:magd_soft_task/modules/login/login_screen.dart';
import 'package:magd_soft_task/modules/splash/splash_screen.dart';
import 'package:magd_soft_task/shared/network/local/cache_helper.dart';
import 'package:magd_soft_task/shared/network/remote/dio_helper.dart';
import 'package:magd_soft_task/shared/styles/colors.dart';

import 'modules/home/home_screen.dart';

main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: SplashScreen.routeName,

      title: "Magd Soft",
      theme: ThemeData(
        primaryColor: defaultColor,
        fontFamily: "Inter",

      ),
    );
  }
}
