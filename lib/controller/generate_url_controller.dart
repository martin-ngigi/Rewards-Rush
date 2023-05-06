import 'package:get/get.dart';
import 'package:rewards_rush/models/generate_url_model.dart';
import 'package:rewards_rush/models/generate_url_reponse_model.dart';
import 'package:rewards_rush/widgets/show_custom_snackbar.dart';

import '../data/repository/auth_repo.dart';
import '../models/response_model.dart';

class GenerateUrlController extends GetxController implements GetxService{
  final GenerateUrlRepo authRepo;
  GenerateUrlController({
    required this.authRepo
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  String _message = "";
  String get message => _message;

  late GenerateUrlResponseModel _generateUrlResponseModel;

  GenerateUrlResponseModel get userModel => _generateUrlResponseModel;



  Future<ResponseModel> registration(GenerateUrlModel generateUrlModel, String phone) async {
    _isLoading = true;
    update(); //same as setState(){}
    Response response = await authRepo.registration(generateUrlModel);
    late ResponseModel responseModel;

    print("------>[GenerateUrlController] Response of budypal is: $response");

    if(response.statusCode == 200){
    //   success response
      responseModel = ResponseModel(true, "success in budypal payment link generation... ");

      _generateUrlResponseModel = GenerateUrlResponseModel.fromJson(response.body);
      print("----->[GenerateUrlController] ${_generateUrlResponseModel.data?.authorizationUrl}");

      String? cstUrl=_generateUrlResponseModel.data?.authorizationUrl;
      _message = cstUrl!;
      sendPhoneAndUrl(cstUrl!, phone);
      // _isLoading = true;
      responseModel = ResponseModel(true, "successfully sent Budpay...");
    }
    else{
      _isLoading = false;
      update(); //
      //error response
      print("------>1 [GenerateUrlController] Error encountered ...");
      showCustomSnackBar(" Error encountered while sendding to budpay.");
      responseModel = ResponseModel(false, "failed in sending to Budpay ... ");

    }
    // _isLoading = false;
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

    if(response.statusCode == 200){
      //   success response
      print("-------success sending sms");
      responseModel = ResponseModel(true, "successfully");
    }
    else{
      //error response
      print("------>2 [GenerateUrlController] Error encountered , failed in sending SMS...");
      showCustomSnackBar(" Error encountered while sending sms.");
      responseModel = ResponseModel(false, "failed in sending SMS... ");

    }
    _isLoading = false;
    update(); //same as setState(){}
    return responseModel;
  }




}