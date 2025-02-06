
import 'package:fasty/Controller/home/menu_controller.dart';
import 'package:fasty/View/Widgets/Functions/rows.dart';
import 'package:fasty/View/Widgets/Classes/category_card.dart';
import 'package:fasty/View/Widgets/Classes/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu extends GetView<Menucontroller> {
  final int? category;
  const Menu({super.key, this.category});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Menucontroller());
    category != null ? controller.selectedCategoryId = category! : null;
     controller.changedCategory = category != null;
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(right: 13.5, left : 13.5, top: 8),
        
        child: GetBuilder<Menucontroller>(
          builder: (controller) => 
          
             ListView(
            children: [
              searchRow((val){controller.search(val);}, (){controller.sort();}),
                SizedBox(height: 16,),
                
                SingleChildScrollView(scrollDirection: Axis.horizontal,child: Row(children: 
                   List.generate(controller.categories.length, (i) => CategoryCard(name: controller.categories[i].name.toString(), 
                   selected: i == controller.selectedCategoryPosition, isLast: i == controller.categories.length -1, 
                   fontSize: 15, borderWidth: 2, onPressed: (){controller.changeSelected(i, controller.categories[i].id!);}),
                )),),
            
                SizedBox(height: 9,),
            
            ItemsGridView(items: controller.searchedItems, onPressed: (val){controller.changeFavorite(val);},
            ), SizedBox(height: 20,),
            
             ])
            
        )
        ) ) ;
        
  }



}