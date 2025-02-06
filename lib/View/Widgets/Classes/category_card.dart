

import 'package:fasty/Core/Constant/colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final bool selected;
  final bool isLast;
  final double fontSize;
  final double borderWidth;
  final String name;
  final void Function() onPressed;
  const CategoryCard({super.key,  required this.name, required this.selected, required this.isLast, 
  required this.fontSize, required this.borderWidth, required this.onPressed});
  @override
  Widget build(BuildContext context) {
     return   Padding(
      padding:  EdgeInsets.only(right: !isLast ? 10 : 0),
      child: Container( 
        constraints: BoxConstraints(minWidth: 100,),
        child: OutlinedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(
                  backgroundColor: !selected ? AppColors.white : AppColors.organgeYellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  side: BorderSide(width: borderWidth, color: !selected ? AppColors.black : AppColors.organgeYellow),
                ),
                child: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold,
                    color: !selected ? AppColors.black : AppColors.white,
                    fontSize: fontSize,
                  ),
                ),
              ),
      ),
    );
  }

}