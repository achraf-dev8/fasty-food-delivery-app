
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Functions/shapes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Success extends StatelessWidget {
 
 const Success({super.key});
  @override
  Widget build(BuildContext context) {
  
 final Map<String, dynamic> arguments = Get.arguments;
 final String description = arguments['description'];
 final onContinue = arguments['onContinue'];

    return Scaffold(
      body:authPadding(
        Column( crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Success!", style: TextStyle(color: AppColors.black, fontSize:32, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Text(description, style: TextStyle(color: AppColors.black, fontSize:18.5),),
            SizedBox(height: 70,),
            circle(Icon(FontAwesomeIcons.check, color: AppColors.white, size :65), 95, null, AppColors.green),
            SizedBox(height: 70,),
            nextButton(onContinue, "Continue"),
            SizedBox(height: 90,),

          ],
        ),
      )
    );
  }

}