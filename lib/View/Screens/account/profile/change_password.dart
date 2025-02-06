
import 'package:fasty/Controller/account/profile/change_password_controller.dart';
import 'package:fasty/Core/Constant/images.dart';
import 'package:fasty/View/Screens/error/handling-request-view.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Functions/text_feilds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends GetView<ChangePasswordController> {
  const ChangePassword ({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ChangePasswordController());
    return Scaffold(
      body: 
      Form( key : controller.formKey,
        child: GetBuilder<ChangePasswordController>(
          builder: (controller) =>
             HandlingRequestView( statusRequest: controller.statusRequest, update: ()async {await controller.updateStatusRequest();},
              widget: authPadding(
                Center(
                  child: ListView(
                    children: [
                      textBackButtonAppBar(context, "Change password"),  SizedBox(height: 75,), 
                                  Image.asset(
                                  AppImages.resetPasswordImage,
                                  height: 85,
                                  width: 85,
                                ),
                              const SizedBox(height: 35,),
                              passwordTextFeild("Old Password", controller.passwordController, false, true,
                              controller.passwordObscureText, (){controller.passwordShowHideText();}),
                              passwordTextFeild("New Password", controller.newPasswordController, true, false,
                              controller.newPasswordObscureText, (){controller.newPasswordShowHideText();}),
                              confrimPasswordTextFeild("Password", controller.confirmPasswordController, 
                              controller.confirmObscureText, (){controller.confrimShowHideText();}, controller),
                              const SizedBox(height: 5),
                                 nextButton(()async {controller.nextStep();}, "Save"),
              
                           
                      
                    ],
                  ),
                ),
              ),
            )
        ),
      )
    );
  }

}