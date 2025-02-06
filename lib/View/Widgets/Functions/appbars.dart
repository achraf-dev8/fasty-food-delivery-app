
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:flutter/material.dart';

Widget welcomeBar(BuildContext context, String text){
  return Container(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(text, style : const TextStyle(color: AppColors.black, fontSize: 24, fontWeight: FontWeight.bold)),
    ),
  );
}


Widget textBackButtonAppBar(BuildContext context, String text,){
     return globalButtonAppBar(context, text, 21, 40, 12, 25);
}

Widget globalButtonAppBar(BuildContext context, String text, double iconSize, double circleSize, double width, double fontSize){
       return Row(
       children: [
        backIconButton(iconSize, circleSize),
        SizedBox(width:width), Text(text, style:TextStyle(color: AppColors.black, fontSize: fontSize, fontWeight: FontWeight.bold)),
       ],
     );    
}