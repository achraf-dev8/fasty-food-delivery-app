
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/checkinternet.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/account/profile/edit_login.dart';
import 'package:fasty/Data/DataSource/Remote/auth/otp.dart';
import 'package:fasty/main.dart';
import 'package:get/get.dart';
import 'dart:math';

class OtpVerficationController extends GetxController{
  
  OtpVerficationController(this.method);

EditLoginData editLoginData = EditLoginData(Get.find());
OtpData otpData = OtpData(Get.find());
bool wrongOtp = false;
int counter1 = 0;
int counter2 = 0;
int otp = 0000;
int? enterdOtp;
String invalidText = "Invalide OTP";
String resendOtpText = "Resend OTP";
StatusRequest statusRequest = StatusRequest.sucsses;
late String destination;
String method;

final Map<String, double> fontSizes = {"Invalide OTP" : 15, "You've reached the limit of attempts!" : 14,
"Resend OTP" : 17, "A new OTP has been sent!" : 16.7, "You've reached the limit of resending OTPs!" :14};

    updateStatusRequest() async{
    statusRequest = await checkInternetFull(); 
    if(statusRequest == StatusRequest.sucsses){
      await sendOtp();
    }  
  }

  @override
    void onReady() async{
      destination = Get.arguments["destination"];
      if(invalidText == "Invalide OTP"){
        wrongOtp = false;
      }
      await updateStatusRequest();
    super.onReady();
  }

      sendOtp() async{
      statusRequest = StatusRequest.loading;
      update();
      otp = 1000 + Random().nextInt(9000);

                        Get.snackbar(
                          otp.toString(), otp.toString(),
                      snackPosition: SnackPosition.BOTTOM
                  );
                  statusRequest = StatusRequest.sucsses;
                  /*
      if(method == "Phone OTP"){
      var response = await otpData.sendPhone(destination, otp);
      statusRequest = handlingData(response);
      }else{
      var response = await otpData.sendEmail(destination, otp);
      statusRequest = handlingData(response);
      }
      */
      update();
      
      

    }

    resendOtp() async{
      counter2 ++;
      if(counter2 <= 4){
      resendOtpText = "A new OTP has been sent!";
      update();
        Future.delayed(const Duration(seconds: 2), () {
    resendOtpText = "Resend OTP"; update();
  });
      await sendOtp();
  }else{
    resendOtpText = "You've reached the limit of resending OTPs!";
    update();
  }
  }

changeOtpState(bool val){
  
  if(wrongOtp != val){
  if(invalidText != "You've reached the limit of attempts!"){
    wrongOtp = val;
    update();
  }}
}

nextStep(String onContinue, Map arguments) async{

  if(!wrongOtp){

    if(otp == enterdOtp){
          if(onContinue == AppRoutes.profile){
            statusRequest = StatusRequest.loading;
            update();
             var response = await editLoginData.postData(arguments["login"], arguments["logintype"]);
            statusRequest = handlingData(response);

            if(statusRequest == StatusRequest.sucsses){
              sharedPrefs.setString(arguments["logintype"], arguments["login"]);
               Get.offNamedUntil(AppRoutes.profile, (route) => route.settings.name == AppRoutes.home,);
            }else{
              update();
            }

          }
          else{
            Get.toNamed(onContinue, arguments : arguments);
          }
          
    }else{
      counter1++;
      if(counter1 > 4){
        invalidText = "You've reached the limit of attempts!";
        wrongOtp = true;
        update();
      }else{
        changeOtpState(true);
      }
      
    }}
}
changeOtp(String val){
 enterdOtp = int.tryParse(val);
 update();
}


}