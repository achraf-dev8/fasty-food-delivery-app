
import 'package:fasty/Controller/home/favorite_controller.dart';
import 'package:fasty/View/Widgets/Functions/rows.dart';
import 'package:fasty/View/Widgets/Classes/grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends GetView<FavoriteController> {
  const Favorite({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FavoriteController());
    return Scaffold(
      body:Padding(padding:  const EdgeInsets.only(right: 13.5, left : 13.5, top: 8),
      child: GetBuilder<FavoriteController>(
        builder: (controller) => 
        ListView(children: [
          searchRow((val){controller.search(val);}, (){controller.sort();}),
          const SizedBox(height: 16,),
          ItemsGridView(items: controller.searchedItems, onPressed: (val){controller.changeFavorite(val);},
          )
          , const SizedBox(height: 20,),
          ],)
      ),
      )
    );
  }

}