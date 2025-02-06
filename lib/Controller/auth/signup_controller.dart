

import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/checkinternet.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

   SignUpData signupdata = SignUpData(Get.find());
   int currentType = 0;
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
   TextEditingController emailController = TextEditingController();
   TextEditingController phoneNumberController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
   TextEditingController confirmPasswordController = TextEditingController();
   bool passwordObscureText = true;
   bool repeatObscureText = true;
   String? loginExists;
   bool wrongConfirmation = false;
   late String loginText;
   StatusRequest statusRequest = StatusRequest.loading;
   late String logintype;

    @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
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

      void changeType(int val){
        currentType = val;
        update();
  }

nextStep() async{
  
  wrongConfirmation = !(passwordController.text == confirmPasswordController.text);
  update();
  loginExists = null;
    if(formKey.currentState!.validate()){
      logintype = currentType == 0 ? "email" : "phone_number";
      loginText = currentType == 0 ? emailController.text : phoneNumberController.text;
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupdata.postData(loginText, logintype);
      statusRequest = handlingData(response);
      if(StatusRequest.sucsses == statusRequest){
        if(response["status"] == "fail"){
          Map arguments = {"logintype" : logintype, "login" : loginText, "password" : passwordController.text, "type" : "normal"};
        await Get.toNamed(currentType == 0 ? AppRoutes.emailOtp : AppRoutes.phoneOtp, 
         arguments: {"onContinue" : AppRoutes.enterInformation, "destination": loginText, "arguments" : arguments});
         update();
        }else{
          String loginType = currentType == 0 ? "email" : "phone number";
          loginExists = "This $loginType is already in use";
          update();
          await Future.delayed(const Duration(milliseconds: 100));
          formKey.currentState!.validate();
        }
      }else{
        update();
      }
    }
}
passwordShowHideText(){
  passwordObscureText = !passwordObscureText;
  update();

}
repeatShowHideText(){
  repeatObscureText = !repeatObscureText;
  update();
}
}