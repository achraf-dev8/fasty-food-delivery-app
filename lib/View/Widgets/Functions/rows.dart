
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/View/Widgets/Classes/search_textfeild.dart';
import 'package:fasty/View/Screens/home/sorting_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

Widget pagesViewDots(int length,  int animeDuration, int currentPage, double unselectedSize, double slectedSize, double padding){
return Row(
mainAxisAlignment: MainAxisAlignment.center,
children: List.generate(length, (index) => AnimatedContainer(
duration: Duration(milliseconds: animeDuration),
margin:  EdgeInsets.only(right: padding),
width: index != currentPage ? unselectedSize : slectedSize,
height: index != currentPage ? unselectedSize : slectedSize,
decoration: BoxDecoration(
color: index != currentPage ? AppColors.softGrey : AppColors.organgeYellow,
 shape: BoxShape.circle,
 ),
)),); }



Widget searchRow(void Function(String) search, void Function() sort){
  return Row(
                children: [
                  Expanded(
                    child:  SearchTextfeild(search: search, fontSize: 21,),
                  ), 
                   IconButton(icon: const Icon
                  (FontAwesomeIcons.arrowDownWideShort, size: 26, color: AppColors.textFieldDarkGrey,), 
                  onPressed: (){Get.bottomSheet(SortingBottomSheet(onPressed: sort), enableDrag: true);},)
                ],
              );
}