import 'package:auto_size_text/auto_size_text.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/View/Widgets/Functions/shapes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Widget textButton(String text, void Function()? onPressed, TextStyle style){
return TextButton( style: ButtonStyle(
    overlayColor: WidgetStateProperty.resolveWith<Color?>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return AppColors.buttonSplash; 
        }
        return null; 
      },
    ),
  ),
                      onPressed: onPressed,
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: style,
                      ),
                    );
}

Widget globalNextButton(void Function()? onPressed, String text, double width, double height, bool active){
return SizedBox( height: height,
width: width,
child: ElevatedButton(
                      style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(active? AppColors.organgeYellow: AppColors.disabledOrgangeYellow),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      onPressed: onPressed,
                      child: Text(text,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 24, ), ), ),); 
}

Widget nextButton(void Function()? onPressed, String text){
return globalNextButton(onPressed, text, 290, 48, true); 
}

Widget cartIconButton(void Function() onPressed){
  return Stack(
    alignment: Alignment.topRight,
    children: [
      greyCircle(IconButton(icon: const Icon(FontAwesomeIcons.cartShopping, color: AppColors.brownRed, size: 18.5,),
      onPressed: onPressed,), 42, EdgeInsets.zero),
          if (AllData().cartBool == 1) 
      Container(
        width: 13,
        height: 13,
        decoration: const BoxDecoration(
          color: AppColors.red,
          shape: BoxShape.circle,
        ),
      ),
    ],
  );}

Widget backIconButton(double iconSize, double circleSize){
  return greyCircle(IconButton(onPressed: (){Get.back();}, 
        icon:  Icon(FontAwesomeIcons.arrowLeft, size: iconSize, color: AppColors.brownRed,)), circleSize, null);}

Widget amountController(double height, double width, double iconSize, double fontSize, int amount
, void Function() minus, void Function() plus){
return Container(height: height, width: width, decoration: BoxDecoration(
                    border: Border.all(color: AppColors.softGrey, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ), 
                  child : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    IconButton(icon: Icon(FontAwesomeIcons.minus, color: AppColors.black, size: iconSize,), 
                    onPressed:minus
                     ,), Spacer(),
                     
                    Text(amount.toString(), style: TextStyle(color: AppColors.black, fontSize: fontSize),),
                  const Spacer(), IconButton(icon: Icon(FontAwesomeIcons.plus , color: AppColors.black, size: iconSize), 
                  onPressed:plus ,)
                  ],));}

Widget orderButton(Color color, String text, void Function() onPressed){
  return SizedBox( height: 40,width: 97.5, child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(color),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                        onPressed: onPressed,
                        
                        child: AutoSizeText(text,
                        maxLines: 1,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 18.5, ), ), ),);
}

Widget payementMethodButton(IconData icon, String title, void Function() onPressed, bool active){
 return SizedBox(
  width: 120,
   child: OutlinedButton(onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.white, // White background
      side: BorderSide(color: !active ? AppColors.mediumGrey : AppColors.organgeYellow , width: 2.5), // Red border
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Square corners
      ),
      padding: const EdgeInsets.all(20), // Adjust padding to make it square
    ),
    child: Column(children: [
      Icon(icon, size: 30, color: !active ? AppColors.mediumGrey : AppColors.organgeYellow,), SizedBox(width: 4,),
      Text(title, style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 20.5, 
      color: !active ? AppColors.mediumGrey : AppColors.organgeYellow),)
    ],),
   ),
 );
}
