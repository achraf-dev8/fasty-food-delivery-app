

import 'package:fasty/Controller/auth/signup_controller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Core/Constant/images.dart';
import 'package:fasty/View/Screens/error/handling-request-view.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Classes/changetype.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Functions/text_feilds.dart';
import 'package:fasty/View/Widgets/Functions/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SignUp extends GetView<SignUpController> {
   const SignUp ({super.key});
  @override
  Widget build(BuildContext context) {
   Get.put(SignUpController());
    return Scaffold(
      body : 
        Form( key: controller.formKey,
          child: GetBuilder<SignUpController>( builder: (controller) =>
             HandlingRequestView(update:()async{await controller.updateStatusRequest();}, statusRequest: controller.statusRequest,
            widget: SafeArea(
              child: authPadding(       
                  ListView(
                    children: [
                      welcomeBar(context, "Welcome!"),
                      Image.asset(
                                AppImages.logo,
                                height: 70,
                                width: 70,
                              ),
                              const SizedBox(height: 15,), 
                              Container(alignment: Alignment.center,
                                child: const Text("Sign up Using", style: TextStyle(color: AppColors.darkGrey, 
                                fontSize: 22),)),
                                 const SizedBox(height:6),
                                   ChooseType(currentType: controller.currentType, 
                                   emailController: controller.emailController, phoneNumberController: controller.phoneNumberController,
                                   changeType: (val){controller.changeType(val);}, parentController: controller,), 

                               passwordTextFeild("Password", controller.passwordController, true, false,
                               controller.passwordObscureText, (){controller.passwordShowHideText();}),
                               confrimPasswordTextFeild("password", controller.confirmPasswordController,
                               controller.repeatObscureText, (){controller.repeatShowHideText();}, controller),
                               const SizedBox(height: 4),
                               nextButton(() async {await  controller.nextStep();}, "Continue"),
                                SizedBox(height:26),
                                singUpOtherAuthPage(),
                              ],),
                ), 
                           
                            ),
            ),
            )
          ),
        );

  }

}