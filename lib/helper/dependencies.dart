import 'package:get/get.dart';
import 'package:rewards_rush/controller/generate_url_controller.dart';
import 'package:rewards_rush/data/repository/auth_repo.dart';
import 'package:rewards_rush/models/generate_url_reponse_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../controller/popular_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/popular_product_repo.dart';
import '../utils/app_constants.dart';
Future<void> init() async{

  // Obtain shared preferences.
  final sharedPreference =await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreference);

  //api client
  //http://mvs.bslmeiyu.com/api/v1/products/popular
  //appBaseUrl: http://mvs.bslmeiyu.com
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences:Get.find()));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => GenerateUrlRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => GenerateUrlController(authRepo: Get.find()));

}