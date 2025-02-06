  

import 'package:fasty/Core/Constant/colors.dart';
import 'package:flutter/material.dart';

class QuestionColumn extends StatelessWidget {
  final String question;
  final String answer;
  final bool shown;
  final void Function() onTap;
  const QuestionColumn({
    super.key,
  required this.question,
  required this.answer,
  required this.onTap, required this.shown
  });

  @override
  Widget build(BuildContext context) {
    return   Column(children: [Material( color: Colors.transparent,
    child: InkWell(
         onTap: onTap,
        overlayColor: WidgetStateProperty.all<Color>(AppColors.circleGrey),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5.5),
        child: Row(
          children: [
            Text(question ,style: const TextStyle(fontSize: 17.7, fontWeight: FontWeight.bold),), Spacer(),
            AnimatedRotation(
            turns: shown ? 0.25 : 0.0, duration: Duration(milliseconds: 300),
            child: Icon( Icons.keyboard_arrow_right, color: AppColors.mediumGrey, size: 24,),)
          ],
        ),
      ),
    ),
  ),Visibility(visible: shown, child: Text(answer, style: const TextStyle(fontSize: 17.75),)), const Divider(color: AppColors.softGrey,)], );
  }
  }

  
  
  
  
