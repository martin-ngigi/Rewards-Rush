import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rewards_rush/controller/popular_product_controller.dart';
import 'package:rewards_rush/data/repository/popular_product_repo.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();

    var list = Get.find<PopularProductController>().popularProductList;
    return Scaffold(
      body: Center(
        child: Text("Welcome Page:\n list is: ${list}"),
      ),
    );
  }
}
