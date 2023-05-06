// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:rewards_rush/models/generate_url_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class GenerateUrlRepo{
  final ApiClient apiClient;

  GenerateUrlRepo({
    required this.apiClient,
  });

  Future<Response> registration(GenerateUrlModel generateUrlModel) async {
    return await apiClient.postData(AppConstants.GENERATE_URL, generateUrlModel.toJson());
  }

  sendPhoneUrl(Map<String, dynamic> data) async {
    return await apiClient.postData(AppConstants.PHONE_RUL, data);
  }

}