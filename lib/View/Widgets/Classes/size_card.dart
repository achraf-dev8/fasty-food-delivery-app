
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:flutter/material.dart';

class SizeCard extends StatelessWidget {
  final bool selected;
  final bool isLast;
  final String name;
  final void Function() onPressed;
  const SizeCard({super.key, required this.selected, required this.isLast, required this.name, required this.onPressed});
  @override
  Widget build(BuildContext context) {
     return   Padding(
      padding:  EdgeInsets.only(right: !isLast ? 10 : 0),
      child: Container( height: 45, width: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration( color: !selected ? AppColors.white : AppColors.organgeYellow,
                    border: Border.all(
                color: !selected ? AppColors.black : AppColors.organgeYellow,  // Border color
                width: 1.5,            // Border width
              ),
      shape : BoxShape.circle
            ),
        child: TextButton(
          onPressed: onPressed,
          child: AutoSizeText(
            name,
            maxLines: 1,
            minFontSize: 7,
            style: TextStyle(fontWeight: FontWeight.bold,
              color: !selected ? AppColors.black : AppColors.white,
              fontSize: 19,
            ),
          ),
        ),
      ),
    );
  }

}