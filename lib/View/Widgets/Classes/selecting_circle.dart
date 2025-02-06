

import 'package:fasty/Core/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectingCircle extends StatelessWidget {
  final bool selected;
  final void Function() onPressed;
  const SelectingCircle({super.key, required this.selected, required this.onPressed});
  @override
  Widget build(BuildContext context) {
     return   Container( alignment: Alignment.center,
                width: 30,
                height: 30,
                decoration: BoxDecoration(color: !selected ? AppColors.white : AppColors.organgeYellow,
                  shape: BoxShape.circle,
                border: Border.all(color: !selected ? AppColors.black : AppColors.organgeYellow, width: 1.5),
                ),
                child: IconButton(icon: Icon(!selected ? null : FontAwesomeIcons.check, color: AppColors.white,
                size: 14), onPressed: onPressed,),
              );
  }

}