
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/checkinternet.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/auth/reset_password_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordControllerTwo extends GetxController{
  ResetPasswordTwo resendPasswordTwoData = ResetPasswordTwo(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
    bool passwordObscureText = true;
   bool confirmObscureText = true;
  StatusRequest statusRequest = StatusRequest.loading;
    bool wrongConfirmation = false;
    
      @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
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

  
nextStep(int id) async{
  
  wrongConfirmation = !(passwordController.text == confirmPasswordController.text);
  update();
    if(formKey.currentState!.validate()){

      statusRequest = StatusRequest.loading;
      update();
      var response = await resendPasswordTwoData.postData(passwordController.text, id);
      statusRequest = handlingData(response);
      if(StatusRequest.sucsses == statusRequest){
        if(response["status"] == "success"){
        
        Map<String, dynamic> arguments = {"onContinue" : (){Get.offAllNamed(AppRoutes.login);}, 
        'description' : "Your password has been reset" };
        await Get.offAllNamed(AppRoutes.success, arguments: arguments);
        update();
        }else{
          statusRequest = StatusRequest.serverfailure;
          update();
  }
  
  }else{
    update();
  }}}

  passwordShowHideText(){
  passwordObscureText = !passwordObscureText;
  update();

}
confrimShowHideText(){
  confirmObscureText = !confirmObscureText;
  update();
}
}

