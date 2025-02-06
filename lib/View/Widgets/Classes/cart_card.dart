
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasty/Core/Constant/apilinks.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/Data/Model/cart_model.dart';
import 'package:fasty/Data/Model/item_model.dart';
import 'package:fasty/Data/Model/item_size_model.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Functions/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCard extends StatelessWidget {
  final CartModel cartItem;
  final ItemModel item;
  final ItemSizeModel itemSize;
  final String extras;
  final bool favorite;
  final void Function() onPressed;
  final void Function() add;
  final void Function() remove;
  const CartCard({super.key, required this.cartItem, required this.itemSize, required this.extras, required this.onPressed, 
  required this.favorite, required this.add, required this.remove, required this.item});
  @override
  Widget build(BuildContext context) {
     return Expanded(
       child: Card(
                color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),),
            elevation: 3,
            child: InkWell(
           overlayColor: WidgetStateProperty.all<Color>(AppColors.itemClickGrey),
            borderRadius: BorderRadius.circular(10),
                      onTap: () {
            Get.offNamedUntil(AppRoutes.cart, (route) => route.settings.name == AppRoutes.home,);
            Get.toNamed(AppRoutes.itemInformation,
            arguments: {"item" : AllData().items.firstWhere((checkItem)=> checkItem.id == itemSize.item)});
          },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
             Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: onPressed,
                            icon: Icon(
                           !favorite ? Icons.favorite_border : Icons.favorite,
                            color : !favorite ? AppColors.black : AppColors.red,
                            ),
                          ),
                        ), Row(children: [
                            CachedNetworkImage(
                            imageUrl: "${ApiLinks.itemsUploadLink}/${item.image}",
                              height: 55,
                              fit: BoxFit.cover,
                            ), SizedBox(width: 6,), Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [SizedBox( width: 160,
                                  child: Text(
                                    maxLines: 2,
                                    //AllData().items.firstWhere((item) => item.id ==  itemSize.item).name!,
                                  AllData().items.firstWhere((item) => item.id ==  itemSize.item).name!,
                                                            style: TextStyle(
                                                              fontSize: 18.5,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                ), if(itemSize.main != 0)
                                                       Text(
                                                       AllData().sizes.firstWhere((size) => size.id ==  itemSize.size).name!,
                                                        style: const TextStyle(
                              fontSize: 19,
                              color: AppColors.darkGrey,
                              fontWeight: FontWeight.bold,
                                                        ),
                                                      ),],),
                            )
                        ],),    const SizedBox(height: 4), Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                extras,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: AppColors.darkGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ), const SizedBox(height: 3),
                      Row( crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      fullPriceInfo(itemSize.oldPrice!*cartItem.amount!, 
                      itemSize.price!*cartItem.amount!, 16.5, 19.5), const Spacer(), 
                      amountController(40, 123, 14, 20, cartItem.amount!, remove, add)
                      ],), 
                    
                     
                ],
              ),
            ),
            
            ),
       ),
     );
     /*
     Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: InkWell(
          overlayColor: WidgetStateProperty.all<Color>(AppColors.itemClickGrey),
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            Get.offNamedUntil(AppRoutes.cart, (route) => route.settings.name == AppRoutes.home,);
            Get.toNamed(AppRoutes.itemInformation,
            arguments: {"item" : AllData().items.firstWhere((checkItem)=> checkItem.id == itemSize.item)});
          },
          child: Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 7.5),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: onPressed,
                        icon: Icon(
                       !favorite ? Icons.favorite_border : Icons.favorite,
                        color : !favorite ? AppColors.black : AppColors.red,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        CachedNetworkImage(
                        imageUrl: "${ApiLinks.itemsUploadLink}/${item.image}",
                          height: 55,
                          fit: BoxFit.cover,
                        ), SizedBox(width: 6,), Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [AutoSizeText(
                       AllData().items.firstWhere((item) => item.id ==  itemSize.item).name!,
                      textAlign: TextAlign.center,
                      minFontSize: 10,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ), if(itemSize.main != 0)
                    Text(
                      AllData().sizes.firstWhere((size) => size.id ==  itemSize.size).name!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 21,
                        color: AppColors.darkGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),],)
                      ],
                    ),
                    const SizedBox(height: 4), Align(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        maxLines: 1,
                        extras,
                        minFontSize: 5,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.darkGrey,
                        ),
                      ),
                    ), const SizedBox(height: 3),
                    Row( crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    fullPriceInfo(itemSize.oldPrice!*cartItem.amount!, 
                    itemSize.price!*cartItem.amount!, 18, 22), const Spacer(), 
                    amountController(40, 123, 14, 20, cartItem.amount!, remove, add)
                    ],)      
                  ],
                ),
              ),
            ),
          ),
        ),
        
      );
      */
  }

}