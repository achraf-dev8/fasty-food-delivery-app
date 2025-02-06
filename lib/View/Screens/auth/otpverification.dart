
import 'package:fasty/Controller/auth/otpverfication_controller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/View/Screens/error/handling-request-view.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Functions/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';



class OtpVerification extends GetView<OtpVerficationController> {

  final String title, image;
  final double fontSize;
  
   const OtpVerification({super.key, required this.title, required this.image,
   required this.fontSize});

  @override
  Widget build(BuildContext context) {
    Get.put(OtpVerficationController(title), permanent: true);
    controller.onInit();
    return Scaffold(
      body:GetBuilder<OtpVerficationController>(
        builder: (controller) =>
           HandlingRequestView( statusRequest: controller.statusRequest, update: ()async{await controller.updateStatusRequest();},
            widget: SafeArea(
              child: authPadding(
                ListView(
                  children: [
                    textBackButtonAppBar(context, title),
                  SizedBox(height: 50,),
                  Image.asset(image, height: 90, width: 86,),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.center, 
                    child:  Text("Enter OTP Sent To", style: TextStyle(color: AppColors.black, 
                                  fontSize: 22),),
                  padding: EdgeInsets.only(bottom: 2),), Container(
                    alignment: Alignment.center,
                 padding: EdgeInsets.only(bottom: 30),
                    child: Text(Get.arguments != null ? Get.arguments["destination"] : "" , 
                    style: TextStyle(color: AppColors.textFieldGrey, 
                                  fontSize: fontSize), ) ), 
                  OtpTextField(              
                    enabledBorderColor: !controller.wrongOtp ?AppColors.circleGrey : AppColors.red,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    cursorColor: !controller.wrongOtp ? AppColors.organgeYellow : AppColors.red,
                    focusedBorderColor: !controller.wrongOtp ? AppColors.organgeYellow : AppColors.red,
                    borderWidth: 2.5,
                    numberOfFields: 4,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.only(right: 10),
                    fieldWidth: 55,
                    textStyle: TextStyle(color: 
                    !controller.wrongOtp ? AppColors.darkGrey : AppColors.red, fontWeight: FontWeight.bold,
                                  fontSize: 22),
                    borderRadius: BorderRadius.circular(12),
                    
                    showFieldAsBox: true,
                    onCodeChanged: (val){ controller.changeOtpState(false);},
                    onSubmit: (val){ controller.changeOtp(val);},
                    alignment: Alignment.center,
                  ), 
                  SizedBox(height: 6),
                         Visibility( visible: controller.wrongOtp,
                                     child: Container( alignment: Alignment.centerLeft,
                      child: Text(controller.invalidText, style : TextStyle(fontSize: controller.fontSizes[controller.invalidText] , 
                      fontWeight : FontWeight.bold, color: AppColors.red)), padding:EdgeInsets.only(left: 24,)
                      ),
                         ),
                  
                  SizedBox(height: 25,), 
                            nextButton( 
                              controller.invalidText == "Invalide OTP" ?  
                                ()async { await controller.nextStep(Get.arguments["onContinue"], Get.arguments["arguments"]);}
                                 : null,
                            "Continue"
                              ),
                             SizedBox(height: 4),
                              Container( alignment: Alignment.centerRight,
                    child: textButton(controller.resendOtpText, controller.resendOtpText == "Resend OTP"
                     && controller.invalidText == "Invalide OTP"?()async{
                      await controller.resendOtp();} : null, 
                    TextStyle(fontSize: controller.fontSizes[controller.resendOtpText], 
                    fontWeight : FontWeight.bold, color: AppColors.textFieldGrey))),
                              const SizedBox(height: 30),
                     if(Get.arguments != null)
                     Get.arguments["onContinue"] == AppRoutes.enterInformation ? singUpOtherAuthPage() :
                     Get.arguments["onContinue"] == AppRoutes.resetPasswordTwo ? signInOtherAuthPage(false): const SizedBox()
                            ],), 
                           
                            ),
            ),
          )
      )
    );
  }

}