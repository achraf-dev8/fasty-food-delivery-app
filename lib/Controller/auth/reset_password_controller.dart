
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/checkinternet.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/auth/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController{

    ResetPasswordData signupdata = ResetPasswordData(Get.find());
    int currentType = 0;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    StatusRequest statusRequest = StatusRequest.loading;
    String? loginExists;
    late String loginText;
    late String logintype;
        @override
  void dispose() {
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
      loginExists = null;
      if(formKey.currentState!.validate()){
      logintype = currentType == 0 ? "email" : "phone_number";
      loginText = currentType == 0 ? emailController.text : phoneNumberController.text;
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupdata.postData(loginText, logintype);
      statusRequest = handlingData(response);
      if(StatusRequest.sucsses == statusRequest){
        if(response["status"] == "success"){
        int id =response["id"];
         loginText = currentType == 0 ? emailController.text : phoneNumberController.text;
        await Get.toNamed(currentType == 0 ? AppRoutes.emailOtp : AppRoutes.phoneOtp, 
         arguments: {"onContinue" : AppRoutes.resetPasswordTwo, "destination": loginText, "arguments" : {"id":id}});
         update();
        }else{
          if(response["status"] == "banned"){
            loginExists = "Sorry, this account got banned!";
          }else if(response["status"] == "media"){
            loginExists = "This account is linked to a google or facebook account";
          }else{
            loginExists = "No account with this $logintype";
          }
          update();
          Future.delayed(const Duration(milliseconds: 10), () {
    formKey.currentState!.validate();
  });
        }
      }else{
        update();
      }
    }
}


}
