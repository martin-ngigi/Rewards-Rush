import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    //http://mvs.bslmeiyu.com/api/v1/products/popular
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}