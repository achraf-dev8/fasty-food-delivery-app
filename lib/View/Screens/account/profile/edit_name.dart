
import 'package:fasty/Controller/account/profile/edit_name_contoller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Core/Functions/checkinternet.dart';
import 'package:fasty/View/Screens/error/handling-request-view.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Functions/text_feilds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditName extends GetView<EditNameContoller>  {
  const EditName({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => EditNameContoller());
    return Scaffold(
      body:Form(
        key: controller.formKey,
        child: GetBuilder<EditNameContoller>(
          builder: (controller) =>
             HandlingRequestView( statusRequest: controller.statusRequest, update: ()async {await checkInternet();},
              widget: authPadding(
                ListView(
                  children: [
                    textBackButtonAppBar(context, "Name"),
                  const SizedBox(height: 125,),
                  Container(
                    alignment: Alignment.center,
                    child: const Text("Edit Name", style: TextStyle(color: AppColors.darkGrey, 
                                  fontSize: 25),),
                  ), const SizedBox(height: 25,),
                            firstNameTextField(controller.firstNameController),
                            lastNameTextField(controller.lastNameController),
                            const SizedBox(height: 12),
                            nextButton(()async {controller.save();}, "Save"),
                            ],), 
                           
                            ),
            )
        ),
      )
    );
  }

}