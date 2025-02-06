
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fasty/Controller/home/home_page_controller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Core/Functions/change_favorite.dart';
import 'package:fasty/Data/Model/item_model.dart';
import 'package:fasty/View/Widgets/Functions/texts.dart';
import 'package:fasty/View/Widgets/Classes/item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Section extends StatelessWidget {
  final String title;
  final List<ItemModel> list;
  final void Function(int) onPressed;
  const Section({super.key, required this.title, required this.list, required this.onPressed});
  @override
  Widget build(BuildContext context) {
     return  Padding(padding: EdgeInsets.symmetric(horizontal: 13.5), child: Column(children: [
    clickedHomeSection(title, (){}),

     SingleChildScrollView(scrollDirection: Axis.horizontal,child: Row(children:
     List.generate(list.length, (i) => 
     ItemCard(item: list[i], favorite: checkFavorite(list[i].id!),
     onPressed: (){onPressed(list[i].id!);},)),)),
        
                const SizedBox(height: 13.5,),
        
                ],),);
  }

}