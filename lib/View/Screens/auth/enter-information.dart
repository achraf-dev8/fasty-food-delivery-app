
import 'package:fasty/Controller/auth/enter_information_controller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Core/Functions/checkinternet.dart';
import 'package:fasty/View/Screens/error/handling-request-view.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Functions/text_feilds.dart';
import 'package:fasty/View/Widgets/Functions/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterInformation extends GetView<EnterInformationController>  {
  const EnterInformation({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => EnterInformationController());
    return Scaffold(
      body:Form(
        key: controller.formKey,
        child: GetBuilder<EnterInformationController>(
          builder: (controller) =>
             HandlingRequestView( statusRequest: controller.statusRequest, update: ()async {await checkInternet();},
              widget: authPadding(
                ListView(
                  children: [
                    textBackButtonAppBar(context, "Sign up"),
                  SizedBox(height: 70,),
                  Container(
                    alignment: Alignment.center,
                    child: Text("Enter your information", style: TextStyle(color: AppColors.darkGrey, 
                                  fontSize: 22),),
                  ), SizedBox(height: 35,),
                            firstNameTextField(controller.firstNameController),
                            lastNameTextField(controller.lastNameController),
                            addressTextField(controller.addressController),
                            SizedBox(height: 4),
                            nextButton(()async {await controller.nextStep();}, "Continue"),
                              SizedBox(height: 30),
                              singUpOtherAuthPage()
                            ],), 
                           
                            ),
            )
        ),
      )
    );
  }

}