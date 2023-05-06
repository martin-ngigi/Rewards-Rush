//stless
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rewards_rush/controller/generate_url_controller.dart';
import 'package:rewards_rush/models/generate_url_model.dart';

import '../../routes/route_helper.dart';
import '../models/signup_body_model.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/app_text_field.dart';
import '../widgets/big_text.dart';
import '../widgets/custom_loader.dart';

import 'dart:math';


class GenerateUrlPage extends StatelessWidget {//used stateless widget because GET already has statefull.. but one should used stfull
  const GenerateUrlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var amountController = TextEditingController();
    var currencyController = TextEditingController();
    var referenceController = TextEditingController();
    var callbackController = TextEditingController();
    var phoneController = TextEditingController();


    // registration method
    void _registration(GenerateUrlController generateUrlController){
      String email = emailController.text.trim();
      String amount = amountController.text.trim();
      String currency = currencyController.text.trim();
      String reference = referenceController.text.trim();
      String callback = callbackController.text.trim();
      String phone = phoneController.text.trim();

      Random random = new Random();
      int randomNumber = random.nextInt(100000); // from 0 to 9 included
      print("Generated Random Number Between 0 to 9: $randomNumber");

      int randomNumber2 = random.nextInt(10000000)+1; // from 1 to 10 included
      print("Generated Random Number Between 1 to 10: $randomNumber2");

      //create an instance
      GenerateUrlModel generateUrlModel = GenerateUrlModel(
          email: email,
          amount: amount,
          currency: "KES",
          reference:randomNumber2.toString(),
          callback: "www.budpay.com"
      );

      // GenerateUrlModel generateUrlModel = GenerateUrlModel(
      //     email: "adewale@budpay.com",
      //     amount: "20",
      //     currency: "KES",
      //     reference: "123456890123mn4mm5ckpskt0dsjlwk4gsd158q",
      //     callback: "www.budpay.com"
      // );
        generateUrlController.registration(generateUrlModel,phone).then((status){
          if(status.isSuccess){
            print("---> [SignUpPage] Success sending to user");
          }
          else{
            print("------> [GenerateUrlPage] error ");

          }
        });

    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<GenerateUrlController>(builder: (_authController){
        return SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //app logo
              SizedBox(height: Dimensions.screenHeight*0.1,),

              //email
              AppTextField(
                textController: emailController,
                hintText: "Email (optional)",
                icon: Icons.email,
                textType: TextInputType.emailAddress,
              ),
              SizedBox(height: Dimensions.height20,),

              //amount
              AppTextField(
                textController: amountController,
                hintText: "amount",
                icon: Icons.attach_money,
                textType: TextInputType.number,
                isObscure: true, //hide password
              ),
              SizedBox(height: Dimensions.height20,),

              //currency
              AppTextField(
                textController: currencyController,
                hintText: "Currency",
                icon: Icons.person,
                textType: TextInputType.name,
              ),
              SizedBox(height: Dimensions.height20,),

              //reference
              AppTextField(
                textController: referenceController,
                hintText: "Reference",
                icon: Icons.edit,
                textType: TextInputType.text,
              ),

              SizedBox(height: Dimensions.height20,),

              //callback
              AppTextField(
                textController: callbackController,
                hintText: "Callback",
                icon: Icons.edit,
                textType: TextInputType.text,
              ),

              //callback
              AppTextField(
                textController: phoneController,
                hintText: "Phone",
                icon: Icons.edit,
                textType: TextInputType.text,
              ),

              SizedBox(height: Dimensions.height20,),

              //sign up button
              GestureDetector(
                onTap: (){
                 _registration(_authController);
                },
                child: Container(
                  width: Dimensions.screenWidth/2,
                  height: Dimensions.screenHeight/14,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColors.mainColor
                  ),
                  child: Center(
                    child: BigText(
                      text: "Generate url",
                      size: Dimensions.font20, //30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: Dimensions.height20,),

            ],
          ),
        );
      }),

    );
  }
}
