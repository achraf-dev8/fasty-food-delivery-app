

import 'package:fasty/Controller/auth/signin_controller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Core/Constant/images.dart';
import 'package:fasty/Core/Functions/social_media.dart';
import 'package:fasty/Core/Functions/validator.dart';
import 'package:fasty/View/Screens/error/handling-request-view.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Functions/shapes.dart';
import 'package:fasty/View/Widgets/Functions/text_feilds.dart';
import 'package:fasty/View/Widgets/Functions/texts.dart';
import 'package:fasty/View/Widgets/Classes/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LogIn extends GetView<SignInController> {
    const LogIn({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());
    return GetBuilder<SignInController>(
      builder: (controller) {
        return Scaffold( 
          body:HandlingRequestView(update: ()async{await controller.updateStatusRequest();}, 
          statusRequest: controller.statusRequest, widget: SafeArea(
            child: authPadding(
              Form(
                key : controller.formKey,
                child: ListView(children: [ welcomeBar(context, "Welcome Back"),
                const SizedBox(height: 10),
                  Image.asset(
                              AppImages.logo,
                              height: 112,
                              width: 112,
                            ), 
                            const SizedBox(height: 15,),
                            TextFeild(label : "Email or phone number", textController: controller.logInController
                            , valid: (val){ return validInput(val!, 0, 100, "Email or phone number", null, null);},),
                      
                            passwordTextFeild("Password", controller.passwordController, false,
                            false, controller.obscureText, (){controller.showHideText();}),
                            GetBuilder<SignInController>( 
                              builder: (controller) => 
                               Visibility( visible: controller.wrongLoginInfo != null,
                                 child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                                  children : [
                                  const SizedBox(height: 0),
                                  Text(controller.wrongLoginInfo.toString(), style: const TextStyle(color : AppColors.darkRed, fontSize : 14.5)),
                                  const SizedBox(height: 16),
                                                               ]),
                               )
                              
                            ),
                            const SizedBox(height: 4),
                            nextButton(() { 
                               controller.login();
                              }, "Sign in"),
                            const SizedBox(height: 4),
                            Container( alignment: Alignment.centerRight,
                          child: textButton("Forget Password?", (){controller.forgetPassword();}, const TextStyle(fontSize: 17, fontWeight : FontWeight.bold, color: AppColors.textFieldGrey))),
                              const SizedBox(height:15),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [socialMediaCircle(FontAwesomeIcons.google, true, ()async{await signInWithGoogle(controller);}), 
   //socialMediaCircle(FontAwesomeIcons.facebook, false,()async{await signInWithFacebook(controller);}), 
   ],),
                              const SizedBox(height:35),
                              signInOtherAuthPage(true),
                            ],),
              ), 
                         
                          ),
          ),)
        );
      }
    );
  }

}