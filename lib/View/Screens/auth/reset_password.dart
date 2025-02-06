
import 'package:fasty/Controller/auth/reset_password_controller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Core/Constant/images.dart';
import 'package:fasty/View/Screens/error/handling-request-view.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Classes/changetype.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Functions/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ResetPassword extends GetView<ResetPasswordController> {
  const ResetPassword({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ResetPasswordController());
    return Scaffold(
      body:Form(
        key: controller.formKey,
        child: GetBuilder<ResetPasswordController>(
          builder: (controller) =>
             HandlingRequestView( statusRequest: controller.statusRequest, update: () async{await controller.updateStatusRequest();},
              widget: authPadding(ListView(
                  children: [
                    textBackButtonAppBar(context, "Reset password"),  SizedBox(height: 40,), 
                                Image.asset(
                                AppImages.resetPasswordImage,
                                height: 88,
                                width: 88,
                              ), 
                               const SizedBox(height: 35,), 
                               Container(alignment: Alignment.center,
                                child: const Text("Reset password Using", style: TextStyle(color: AppColors.darkGrey, 
                                fontSize: 22),)),
                                 SizedBox(height:10),
                               ChooseType(currentType: controller.currentType, emailController: controller.emailController, 
                               phoneNumberController : controller.phoneNumberController, changeType: controller.changeType, 
                               parentController: controller),
              
                              SizedBox(height: 4),
                               nextButton(() async{await controller.nextStep();}, "Continue"),
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