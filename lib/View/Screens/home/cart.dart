

import 'package:fasty/Controller/home/cart_controller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Core/Functions/change_favorite.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/shapes.dart';
import 'package:fasty/View/Widgets/Functions/texts.dart';
import 'package:fasty/View/Widgets/Classes/cart_card.dart';
import 'package:fasty/View/Widgets/Classes/selecting_circle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Cart extends GetView<CartController> {
  const Cart({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartController());
    return Scaffold( body: 
    controller.items.isNotEmpty ? Padding( padding: const EdgeInsets.only(right: 20, left :20, top: 20),
              child: Stack(
                children: [
                  GetBuilder<CartController>(
                    builder: (controller) {
                      return ListView(
                            children: [ globalButtonAppBar(context, "Cart", 19, 37, 10, 22),
                              const SizedBox(height: 30,), Flexible(
                                child: Row( crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                  SelectingCircle(onPressed: (){controller.selectAll();}, selected:  controller.allSelected),
                                  const  SizedBox(width: 7,),
                               Text("${controller.selectedItems.length}/${controller.items.length} Items", 
                               style: const TextStyle(color: AppColors.black, fontSize : 19.5), ), const Spacer(),
                                                     greyCircle(IconButton(onPressed: () { controller.showDeleteDialog();}, 
                                          icon:  const Icon(FontAwesomeIcons.trash, size: 19.5, color: AppColors.brownRed,)), 40, null),
                                
                               ],),),
                      
                       const SizedBox(height: 12,),
                         
                         ListView.builder(physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.items.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i)=>Row(crossAxisAlignment: CrossAxisAlignment.center,
                         children: [selectingCircle((){controller.selectItem(i);}, controller.selectedItems.contains(i)), 
                         const SizedBox(width: 5,), CartCard(cartItem: controller.items[i], extras: controller.getExtras(i),
                         favorite: checkFavorite(controller.getItemId(controller.items[i],), ), 
                         onPressed: (){controller.changeFavorite(controller.getItemId(controller.items[i]),);},
                         itemSize : controller.itemSizes.firstWhere((itemSize) => controller.items[i].itemSize == itemSize.id),
                         add: (){controller.add(i);}, remove: (){controller.remove(i);},
                         item: AllData().items.firstWhere((it)=>it.id == controller.getItemId(controller.items[i])),
                         )],
                         )
                        
                          ), const SizedBox(height : 10),  const SizedBox(height: 75,)
                         ],);
                    }
                  ), 
                     Positioned(
                      
                                  left: 0,
            right: 0,
            bottom: 0,child: Container(
            decoration: const BoxDecoration( color: AppColors.white,
              border: Border(top: BorderSide(color: AppColors.softGrey))),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: GetBuilder<CartController>(
            builder: (controller) {
              return Row(children: [fullPriceInfo(controller.totalOldPrice, controller.totalPrice, 17.5, 21.5),
              const Spacer(),  SizedBox( height: 47, width: 150,
                    child: ElevatedButton( style: ButtonStyle(
                               backgroundColor: WidgetStateProperty.all<Color>(controller.selectedItems.isNotEmpty ?
                                AppColors.organgeYellow : AppColors.disabledOrgangeYellow),
                               shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                 RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(8),), ),),
                             onPressed: controller.selectedItems.isNotEmpty ? (){controller.toCheckout();} : null,
                             child: Text("Order (${controller.selectedItems.length})",
                               style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                 color: AppColors.white,
                                 fontSize: 24,),),
                     ),
                   ),
                       ],);
            }
          ),  )
      )
                ],
              
        ), ) : Padding(
         padding: const EdgeInsets.only(right: 20, left :20, top: 20),
          child: ListView(children: [globalButtonAppBar(context, "Cart", 19, 37, 10, 22),],),
        ),);
  }

}