  

import 'package:fasty/Core/Constant/colors.dart';
import 'package:flutter/material.dart';

class PagesViewDots extends StatelessWidget {
  final List list;
  final int animeDuration;
  final int currentPage;
  final double unselectedSize;
  final double slectedSize;
  final double padding;

  const PagesViewDots({
    super.key, required this.list, required this.animeDuration, required this.currentPage, 
    required this.unselectedSize, required this.slectedSize, required this.padding,

  });

  @override
  Widget build(BuildContext context) {
    return  Row(
mainAxisAlignment: MainAxisAlignment.center,
children: List.generate(list.length, (index) => AnimatedContainer(
duration: Duration(milliseconds: animeDuration),
margin:  EdgeInsets.only(right: padding),
width: index != currentPage ? unselectedSize : slectedSize,
height: index != currentPage ? unselectedSize : slectedSize,
decoration: BoxDecoration(
color: index != currentPage ? AppColors.softGrey : AppColors.organgeYellow,
 shape: BoxShape.circle,
 ),
)),);
  }
  }

  
  
  
  
