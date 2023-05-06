import 'package:flutter/material.dart';
import 'package:rewards_rush/pages/welcome_page.dart';
import 'package:rewards_rush/routes/route_helper.dart';
import 'package:rewards_rush/utils/colors.dart';
import 'controller/popular_product_controller.dart';
import 'controllers/popular_product_controller.dart';
import 'helper/dependencies.dart' as dep;
import 'package:get/get.dart';
Future<void> main() async {
  //wait till all dependencies are loaded
  WidgetsFlutterBinding.ensureInitialized();

  //load the dependencies
  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(builder: (_){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        //home: SignInPage(),
        //home: SplashScreen(),
        initialRoute: RouteHelper.getSplashPage(),
        getPages: RouteHelper.routes,
        theme: ThemeData(
            primaryColor: AppColors.mainColor,
            fontFamily: "Lato"
        ),
      );
    });
  }
}
