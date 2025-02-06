
import 'package:fasty/Controller/auth/reset-password-two-controller.dart';
import 'package:fasty/Core/Constant/images.dart';
import 'package:fasty/View/Screens/error/handling-request-view.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Functions/text_feilds.dart';
import 'package:fasty/View/Widgets/Functions/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordTwo extends GetView<ResetPasswordControllerTwo> {
  const ResetPasswordTwo ({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ResetPasswordControllerTwo());
    return Scaffold(
      body: 
      Form( key : controller.formKey,
        child: GetBuilder<ResetPasswordControllerTwo>(
          builder: (controller) =>
             HandlingRequestView( statusRequest: controller.statusRequest, update: ()async {await controller.updateStatusRequest();},
              widget: authPadding(
                ListView(
                  children: [
                    textBackButtonAppBar(context, "Reset password"),  SizedBox(height: 50,), 
                                Image.asset(
                                AppImages.resetPasswordImage,
                                height: 85,
                                width: 85,
                              ),
                            SizedBox(height: 37,), 
                            passwordTextFeild("New Password", controller.passwordController, true, false,
                            controller.passwordObscureText, (){controller.passwordShowHideText();}),
                            confrimPasswordTextFeild("Password", controller.confirmPasswordController, 
                            controller.confirmObscureText, (){controller.confrimShowHideText();}, controller),
                              SizedBox(height: 4),
                               nextButton(()async {await controller.nextStep(Get.arguments["id"]);}, "Continue"),
                               SizedBox(height:18),
                                signInOtherAuthPage(false),
                         
                    
                  ],
                ),
              ),
            )
        ),
      )
    );
  }

}