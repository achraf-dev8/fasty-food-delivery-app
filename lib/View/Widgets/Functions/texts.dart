

import 'package:fasty/Controller/auth/signup_controller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

Widget otherAuthPage(String text, String buttonText, var onPressed){
        return Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text, style: TextStyle(color: AppColors.mediumGrey, fontSize: 18),),
      textButton(buttonText, onPressed, TextStyle(color: AppColors.organgeYellow, fontWeight: FontWeight.bold, fontSize: 19)),

    ],);
}

Widget singUpOtherAuthPage(){
  return otherAuthPage("Already have an account?", "Sign in", (){Get.offAllNamed(AppRoutes.login);
Get.delete<SignUpController>();
  });
}

Widget signInOtherAuthPage(bool isFirstPage){
  return otherAuthPage("Don't have an account?", "Sign up", (){  
    if(isFirstPage){
      Get.toNamed(AppRoutes.signup);
    }else{
         
      Get.offAllNamed(AppRoutes.signup);
    }
  },);
  }

  Widget clickedHomeSection(String title, void Function()? onPressed){
        return Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Text(title, style: TextStyle(color: AppColors.black, fontSize: 19.75, fontWeight: FontWeight.bold),),
                )
              
              ],);

  }
  Widget homeSection(String title){
    return Container( alignment: Alignment.centerLeft,
      child: Text(title, style: const TextStyle(color: AppColors.black, fontSize: 21, 
      fontWeight: FontWeight.bold,),),
    );
  }

  Widget fullPriceInfo(double oldPrice, double newPrice, double firstSize, double secondSize){
    NumberFormat formatter = NumberFormat('#.##');
    String roldPrice = formatter.format(oldPrice);
    String rnewPrice = formatter.format(newPrice);
    return Row(children: [Visibility(visible: !(oldPrice == newPrice),
      child: Stack(children: [Text("$roldPrice\$", style: TextStyle( fontSize: firstSize,
                fontWeight: FontWeight.bold, color: AppColors.mediumGrey),), 
                Positioned(left: 0,right: 0,top: firstSize/1.6, child: Container( height: 1, color: AppColors.mediumGrey,),),],
             ),
    ), const SizedBox(width: 6,), Text( "$rnewPrice\$", style: TextStyle( fontSize: secondSize, fontWeight: FontWeight.bold,),
                  ),],);

  }
  

