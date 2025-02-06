
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/checkinternet.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/auth/signup.dart';
import 'package:fasty/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditLoginContoller extends GetxController{
  SignUpData editLoginData = SignUpData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String logintype = "email";
  String loginStrongType = "Email";
  String title = "Edit";
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  StatusRequest statusRequest = StatusRequest.sucsses;
  bool passwordObscureText = true;
  String? loginExists;
  

  @override
  void dispose() {
    loginController.dispose();
    loginController.dispose();
    super.dispose();
  }
    updateStatusRequest() async{
    statusRequest = await checkInternetFull();
      update();
  }

    @override
    void onReady() async{
    logintype = Get.arguments["logintype"];
    loginStrongType = logintype == "phone_number" ? "Phone number" : "Email";
    loginController.text = sharedPrefs.getString(logintype)!;
    title = loginController.text.isEmpty ? "Add" : "Edit";
    update();
  }

  passwordShowHideText(){
  passwordObscureText = !passwordObscureText;
  update();

}
  
next() async{

  if(sharedPrefs.getString(logintype)! == loginController.text){
    Get.offNamedUntil(AppRoutes.profile, (route) => route.settings.name == AppRoutes.home,);
    return null;
  }

  loginExists = null;
      if(formKey.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await editLoginData.postData(loginController.text, logintype);
      statusRequest = handlingData(response);
      if(StatusRequest.sucsses == statusRequest){
        if(response["status"] == "fail"){

        Map arguments = {"logintype" : logintype, "login" : loginController.text};
        await Get.toNamed(logintype == "email" ? AppRoutes.emailOtp : AppRoutes.phoneOtp, 
         arguments: {"onContinue" : AppRoutes.profile, "destination": loginController.text, "arguments" : arguments});
         update();
        // Get.defaultDialog(title : arguments.toString());
        }else{
          String loginWeakType = logintype == "email" ? "email" : "phone number";
          loginExists = "This $loginWeakType is already in use";
          update();
          await Future.delayed(const Duration(milliseconds: 10), () {
    formKey.currentState!.validate();
  });
        }
      }else{
        update();
      }
    }

}



}