
import 'package:fasty/Controller/account/profile/edit_login_contoller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Core/Functions/checkinternet.dart';
import 'package:fasty/View/Screens/error/handling-request-view.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Functions/text_feilds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditLogin extends GetView<EditLoginContoller>  {
  const EditLogin({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => EditLoginContoller());
    return Scaffold(
      body:Form(
        key: controller.formKey,
        child: GetBuilder<EditLoginContoller>(
          builder: (controller) =>
             HandlingRequestView( statusRequest: controller.statusRequest, update: ()async {await checkInternet();},
              widget: authPadding(
                ListView(
                  children: [
                    textBackButtonAppBar(context, controller.loginStrongType),
                  const SizedBox(height: 125,),
                  Container(
                    alignment: Alignment.center,
                    child:  Text("${controller.title} ${controller.loginStrongType}", style: const TextStyle(color: AppColors.darkGrey, 
                                  fontSize: 25),),
                  ), const SizedBox(height: 25,),
                            controller.loginStrongType == "Email" ?
                            gloabalEmailTextField("New ${controller.loginStrongType}", controller.loginController, controller)
                            :phoneTextFeild(controller.loginController, controller)
                            ,
                            passwordTextFeild("Password", controller.passwordController, 
                            false, true, controller.passwordObscureText, (){controller.passwordShowHideText();}),
                            const SizedBox(height: 12),
                            nextButton(()async {controller.next();}, "Next"),
                            ],), 
                           
                            ),
            )
        ),
      )
    );
  }

}