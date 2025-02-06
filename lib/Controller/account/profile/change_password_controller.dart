
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/checkinternet.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/auth/reset_password_two.dart';
import 'package:fasty/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  ResetPasswordTwo resendPasswordTwoData = ResetPasswordTwo(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool passwordObscureText = true;
  bool newPasswordObscureText = true;
  bool confirmObscureText = true;
  StatusRequest statusRequest = StatusRequest.sucsses;
  bool wrongConfirmation = false;
    
      @override
  void dispose() {
    passwordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
    updateStatusRequest() async{
    statusRequest = await checkInternetFull();
      update();
  }

  
nextStep() async{
  
  wrongConfirmation = !(newPasswordController.text == confirmPasswordController.text);
  update();
    if(formKey.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await resendPasswordTwoData.postData(newPasswordController.text, sharedPrefs.getInt("id")!);
      statusRequest = handlingData(response);
      
      if(StatusRequest.sucsses == statusRequest){

        Map<String, dynamic> arguments = {"onContinue" : (){
          Get.offNamed(AppRoutes.profile);}, 
        'description' : "Your password has been changed" };
        sharedPrefs.setString("password", newPasswordController.text);       
        Get.offNamedUntil(AppRoutes.success, (route) => route.settings.name == AppRoutes.home, arguments: arguments);
  }else{
    update();
  }}}

  passwordShowHideText(){
  passwordObscureText = !passwordObscureText;
  update();

}
  newPasswordShowHideText(){
  newPasswordObscureText = !newPasswordObscureText;
  update();
}
confrimShowHideText(){
  confirmObscureText = !confirmObscureText;
  update();
}
}

