
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Functions/text_feilds.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChooseType extends StatelessWidget {
  final int currentType;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final void Function(int) changeType;
  final GetxController parentController;
  const ChooseType({super.key, required this.currentType, required this.emailController, required this.phoneNumberController, 
  required this.changeType, required this.parentController});
  @override
  Widget build(BuildContext context) {
    return Column( children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children:  List.generate(2, (val) => Column(
             children: [
               textButton(val == 0 ? "Email" : "Phone number", (){changeType(val);}, TextStyle(
                     fontSize: currentType == val ? 20 :19,
                     color: currentType == val ? AppColors.organgeYellow : AppColors.darkMediumGrey,
                   ),),
               AnimatedContainer(
                duration: Duration(milliseconds: 250),
                 margin: EdgeInsets.only(top: 2),
                 height: 3,
                 width: currentType  == val ? 50 : 0,
                 color: AppColors.organgeYellow,
               ),
             ],
           ),
        ),
        ),   const SizedBox(height: 20),
        currentType == 0 ? emailTextField(emailController, parentController) : phoneTextFeild(phoneNumberController, parentController),
        ]);
  }

}