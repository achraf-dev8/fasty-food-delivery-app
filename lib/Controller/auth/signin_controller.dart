
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/checkinternet.dart';
import 'package:fasty/Core/Functions/signInProccess.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{

  LoginData logindata = LoginData(Get.find());
  GlobalKey <FormState> formKey = GlobalKey<FormState>();
  TextEditingController logInController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  String? wrongLoginInfo;

  StatusRequest statusRequest = StatusRequest.loading;
  late String logintype;

  @override
  void dispose() {
    passwordController.dispose(); 
    logInController.dispose();
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

forgetPassword(){
    Get.toNamed(AppRoutes.resetPassword);
}

  
  login() async{

    
wrongLoginInfo = null;

    if(formKey.currentState!.validate()){
      
    RegExp regExp = RegExp(r'[a-zA-Z]');
    
    logintype = regExp.hasMatch(logInController.text) ? "email" : "phone_number";
      statusRequest = StatusRequest.loading;
      update();
      
      var response = await logindata.postData(logInController.text, logintype, passwordController.text);
      
      statusRequest = handlingData(response);
      if(StatusRequest.sucsses == statusRequest){
        
        if(response["status"] == "success"){

        signInProccess(response);
        }else if(response["status"] == "banned"){
         wrongLoginInfo = "Sorry, this account got banned!";
        }else{
          wrongLoginInfo = "Wrong login or password";
        }
      
      }
      
      }
    
    update();
      

}

showHideText(){
  obscureText = !obscureText;
  update();
}




}