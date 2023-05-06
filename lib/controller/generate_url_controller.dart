import 'package:get/get.dart';
import 'package:rewards_rush/models/generate_url_model.dart';
import 'package:rewards_rush/models/generate_url_reponse_model.dart';

import '../data/repository/auth_repo.dart';
import '../models/response_model.dart';

class GenerateUrlController extends GetxController implements GetxService{
  final GenerateUrlRepo authRepo;
  GenerateUrlController({
    required this.authRepo
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  late GenerateUrlResponseModel _generateUrlResponseModel;

  GenerateUrlResponseModel get userModel => _generateUrlResponseModel;



  Future<ResponseModel> registration(GenerateUrlModel generateUrlModel, String phone) async {
    _isLoading = true;
    update(); //same as setState(){}
    Response response = await authRepo.registration(generateUrlModel);
    late ResponseModel responseModel;

    print("------>[GenerateUrlController] Response: $response");

    if(response.statusCode == 200){
    //   success response
      responseModel = ResponseModel(true, "success in... ");

      _generateUrlResponseModel = GenerateUrlResponseModel.fromJson(response.body);
      print("----->[GenerateUrlController] ${_generateUrlResponseModel.data?.authorizationUrl}");

      String? cstUrl=_generateUrlResponseModel.data?.authorizationUrl;
      sendPhoneAndUrl(cstUrl!, phone);
      _isLoading = true;
      responseModel = ResponseModel(true, "successfully");
    }
    else{
      //error response
      print("------>1 [GenerateUrlController] Error encountered ...");
      responseModel = ResponseModel(false, "failed in... ");

    }
    _isLoading = false;
    update(); //same as setState(){}
    return responseModel;
   }

  Future<ResponseModel> sendPhoneAndUrl(String cstUrl, String phone) async {

    // to json
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["phonenumber"] = phone;
    data["url"] = cstUrl;

    Response response = await authRepo.sendPhoneUrl(data);
    late ResponseModel responseModel;

    print("------>2 [GenerateUrlController]send sms Response: $response");

    // if(response.statusCode == 200){
    //   //   success response
    //   print("-------success sending sms");
      responseModel = ResponseModel(true, "successfully");
    // }
    // else{
    //   //error response
    //   print("------>2 [GenerateUrlController] Error encountered ...");
    //   responseModel = ResponseModel(false, "failed in... ");
    //
    // }
    _isLoading = false;
    update(); //same as setState(){}
    return responseModel;
  }




}