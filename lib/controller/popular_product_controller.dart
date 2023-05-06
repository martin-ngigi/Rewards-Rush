import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../models/product.dart';
import '../utils/colors.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  
  List<dynamic> _popularProductList = []; //"_" means its private

  bool _isLoaded = false;//private
  bool get isLoaded => _isLoaded;//public getter

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems +  _quantity;

  Future<void> getPopularProductList() async{
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode==200){
      //print("----------->Got products");
      _popularProductList =[];//clear data
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print("------->[PopularProductController] Popular products: ${_popularProductList.length}");
      for(int i=0; i<_popularProductList.length; i++){
        // print("Product $i is ${_popularProductList[i].toString()}\n");
      }
      _isLoaded = true;
      update(); //similar to set state
    }
    else{

    }
  }

  List<dynamic> get popularProductList => _popularProductList; //make the private _popularProductList public


  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity+1);
      print("---> Increase number of items to: "+_quantity.toString());
    }
    else{
      _quantity = checkQuantity(_quantity-1);
      print("---> Drcreased number of items to: "+_quantity.toString());
    }

    update(); //same as setState(){}
  }

  int checkQuantity(int quantity){
    // quantity should not be less than 0 or 20
    if((_inCartItems+quantity)<0){
      //show message
      Get.snackbar("Item count", "You cant reduce more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white
      );
      if(_inCartItems>0){
        _quantity =-_inCartItems;
        return quantity;
      }
      return 0;
    }
    else if((_inCartItems+quantity)>20){
      Get.snackbar("Item count", "You can't add more!",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white
      );
      return 20;
    }
    else{
      return quantity;
    }
  }

}