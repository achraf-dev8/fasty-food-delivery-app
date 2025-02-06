
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/checkinternet.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/account/profile/edit_name.dart';
import 'package:fasty/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditNameContoller extends GetxController{
  EditName editNameData = EditName(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController(text: sharedPrefs.getString("first_name"));
  TextEditingController lastNameController = TextEditingController(text: sharedPrefs.getString("last_name"));
  StatusRequest statusRequest = StatusRequest.sucsses;
  

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }
    updateStatusRequest() async{
    statusRequest = await checkInternetFull();
      update();
  }
  
save() async{

      if(sharedPrefs.getString("first_name") ==  firstNameController.text && 
    sharedPrefs.getString("last_name") ==  lastNameController.text){
      Get.offNamedUntil(AppRoutes.profile, (route) => route.settings.name == AppRoutes.home,);
         return null;
    }

        if(formKey.currentState!.validate()){
      if(formKey.currentState!.validate() ){
        statusRequest = StatusRequest.loading;
        update();
        var response = await editNameData.postData(firstNameController.text, lastNameController.text);
      statusRequest = handlingData(response);
        if(StatusRequest.sucsses == statusRequest){
         sharedPrefs.setString("first_name", firstNameController.text);
         sharedPrefs.setString("last_name", lastNameController.text);
         Get.offNamedUntil(AppRoutes.profile, (route) => route.settings.name == AppRoutes.home,);  
  }
update();
      }}
}



}