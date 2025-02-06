  

import 'package:fasty/Core/Constant/colors.dart';
import 'package:flutter/material.dart';

class ProfileColumn extends StatelessWidget {
  final String name;
  final String? body;
  final void Function() onTap;
  const ProfileColumn({
    super.key,
  required this.name,
  this.body,
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return   Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        overlayColor: WidgetStateProperty.all<Color>(AppColors.circleGrey),
        borderRadius: BorderRadius.circular(10),
        child:  Padding(
          padding: const EdgeInsets.only(left:30, top: 10.5, bottom: 10.5),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [ Text(name, style: 
           TextStyle(fontSize: 23),), Visibility(
            visible: body != null,
             child: Text(body == "" ? "Add $name" : body.toString(), style:
             TextStyle(fontSize: 17, color: AppColors.textFieldGrey), ),
           )],),
        ),
      ),
    );
  }
  }

  
  
  
  
