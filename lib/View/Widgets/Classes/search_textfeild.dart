

import 'package:fasty/Core/Constant/colors.dart';
import 'package:flutter/material.dart';
         
class SearchTextfeild extends StatelessWidget {
  final void Function(String) search;
  final double fontSize;
  const SearchTextfeild({
    super.key,
    required this.search,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
                    onChanged: search,
                    style: TextStyle(fontSize: fontSize+1),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.textFieldDarkGrey, width: 3),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.organgeYellow, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      prefixIcon: Icon(Icons.search , size: 23, color: AppColors.textFieldGrey,),
                      hintStyle: TextStyle(fontSize: fontSize, color: AppColors.textFieldGrey),
                      hintText: "Search",
                    ),     );
  }
}
