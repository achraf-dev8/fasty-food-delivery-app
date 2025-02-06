  

import 'package:fasty/Core/Constant/colors.dart';
import 'package:flutter/material.dart';

class CheckoutRow extends StatelessWidget {
  final String title;
  final String body;
  final IconData icon;
  const CheckoutRow({
    super.key,
  required this.body,
  required this.icon,
  required this.title
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
    padding: EdgeInsets.only(bottom: 17),
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.center, // Aligns the text at the top
    children: [
      Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.5),
      ),
    const  SizedBox(width: 8), 
    Text(
          body,
          style: TextStyle(fontSize: 20, color: AppColors.darkGrey, fontWeight: FontWeight.bold),
          maxLines: null, // Allows unlimited lines
          overflow: TextOverflow.visible, // Ensures it wraps instead of overflowing
        ), const Spacer(),
      Icon(icon, size: 22, color: AppColors.black,), SizedBox(width: 4,),
    ],
    ),
  );
  }
  }

  
  
  
  
