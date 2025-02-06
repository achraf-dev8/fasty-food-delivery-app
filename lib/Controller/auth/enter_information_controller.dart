
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/checkinternet.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/auth/enter_information.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterInformationController extends GetxController{
  EnterInfoData enterInfoData = EnterInfoData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  StatusRequest statusRequest = StatusRequest.loading;
   String email = "";
   String phonenumber = "";
   String password = "";
   String mediaId = "";
  

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    super.dispose();
  }
    updateStatusRequest() async{
    statusRequest = await checkInternetFull();
      update();
  }

  @override
    void onInit() async{
    await updateStatusRequest();
    super.onInit();
  }
  
nextStep() async{
  if(formKey.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      
      if(Get.arguments["type"] == "normal"){
        String logintype = Get.arguments["logintype"];
      logintype == "email" ? email = Get.arguments["login"] : phonenumber = Get.arguments["login"];

      }else{
        email = Get.arguments["email"]; phonenumber = Get.arguments["phone_number"]; mediaId = Get.arguments["media_id"];
      }
      password = Get.arguments["password"];
      var response = await enterInfoData.postData(email, phonenumber, password, 
      firstNameController.text, lastNameController.text, addressController.text, mediaId);
      statusRequest = handlingData(response);
        if(StatusRequest.sucsses == statusRequest){
        if(response["status"] == "success"){
  Map<String, dynamic> arguments = {"onContinue" : (){Get.offAllNamed(AppRoutes.login);}, 
  'description' : "Your account has been created" };
          await Get.offAllNamed(AppRoutes.success, arguments: arguments);
          update();
        }else{
          update();
        }
  }else{
    update();
  }}}



}