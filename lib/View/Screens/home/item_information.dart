

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fasty/Controller/home/item_info_controller.dart';
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Constant/apilinks.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Core/Constant/images.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Functions/dialogs.dart';
import 'package:fasty/View/Widgets/Functions/shapes.dart';
import 'package:fasty/View/Widgets/Functions/texts.dart';
import 'package:fasty/View/Widgets/Classes/category_card.dart';
import 'package:fasty/View/Widgets/Classes/review_card.dart';
import 'package:fasty/View/Widgets/Classes/size_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ItemInformation extends GetWidget<ItemInformationcontroller> {
  const ItemInformation({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ItemInformationcontroller());
    return Scaffold(
      body: GetBuilder<ItemInformationcontroller>(
        builder: (controller) {
          return ListView( 
            children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left :20, top: 20),
              child: Row(
                     children: [backIconButton(23, 45), const Spacer(),
              
              greyCircle(IconButton(onPressed: (){controller.changeFavorite();}, 
         icon: Icon(!controller.favorite ?Icons.favorite_outline : Icons.favorite, size: 26, 
         color:!controller.favorite ? AppColors.black: AppColors.red,)), 45 , null)
                     ],
                   ),
            ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 18),
               child: Column( mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(controller.item.name!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21.5),),
                  const SizedBox(height: 7,),
                  CachedNetworkImage(
                    imageUrl: "${ApiLinks.itemsUploadLink}/${controller.item.image}",
                     height: 140, width: 140, fit: BoxFit.cover,),
                  const SizedBox(height: 10,),
                         
                  Visibility(visible: controller.itemSizes.isNotEmpty ? controller.itemSizes[0].main != 0 : false,
                    child: Column(
                      children: [
                        const Text("Size", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        SingleChildScrollView(scrollDirection: Axis.horizontal,
                           child: Row( mainAxisAlignment: MainAxisAlignment.center,
                           children: List.generate(controller.sizes.length, (i)=>
                           SizeCard(selected: i == controller.selectedSizePosition, isLast: controller.sizes.length - 1 == i, 
                           name: controller.sizes[i].name!, onPressed: (){controller.selectingSize(i, controller.sizes[i].id!);},)),
                           
                            )),
                      ],
                    ),
                  ),
                  
                           const SizedBox(height: 14,),
                  Visibility( visible: controller.extras.isNotEmpty,
                    child: Column(
                      children: [
                        const Text("Add extras", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        SingleChildScrollView(scrollDirection: Axis.horizontal,child: 
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                     children: List.generate(controller.extras.length, (i)=>
                      CategoryCard(borderWidth: 1.5, fontSize: 13,
                        selected: controller.selectedExtrasPositions.contains(i), isLast: controller.extras.length - 1 == i, 
                      name: controller.extras[i].name!, onPressed: (){controller.changeSelectedExtra(i, controller.extras[i].id!);},))
                    ))
                      ],
                    ),
                  ),
                           ]),
             ), const SizedBox(height: 10,),
                const Divider(color: AppColors.softGrey,),
                 Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Description", style: TextStyle(color: AppColors.black, fontSize: 19.5),),
                  Text(controller.item.description!, style: 
                  const TextStyle(fontSize: 15.5, color: AppColors.textFieldDarkGrey),),
                  const SizedBox(height: 10,)
                ],
              ),
            ), 
            const Divider(color: AppColors.softGrey,),
          
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Row(
                    children: [
                     const Text("Reviews", style: TextStyle(color: AppColors.black, fontSize: 19.5),),
                     const SizedBox(width: 10,),
                Visibility( visible: controller.item.rating != 0,
                  child: Text(
                         controller.item.rating.toString(),
                             style: const TextStyle(
                               fontWeight: FontWeight.bold,
                               color: AppColors.yellow,
                               fontSize: 21.5,
                             ),
                           ),
                ), const SizedBox(width: 2.5,), Visibility( visible: controller.item.rating != 0,
                  child: const Icon(
                           FontAwesomeIcons.solidStar,
                           color: AppColors.yellow,
                           size: 17.5,
                         ),
                ), 
                      const Spacer(), 
                      Visibility( visible: controller.statusRequest == StatusRequest.sucsses && 
                      controller.hasReview == 0 ,
                        child: ElevatedButton(style: ButtonStyle(
                           backgroundColor: WidgetStateProperty.all<Color>(AppColors.organgeYellow),
                           shape: WidgetStateProperty.all<RoundedRectangleBorder>( RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () async{ await reviewDialog(controller.item.id!, "Add", 0,

                         TextEditingController(text: ""), (review){controller.addReview(review);}, 
                         
                         (comment, rating, id){controller.editReview(comment, rating, id);});},

                        child: const Row(
                                            children: [Text("Review",style: TextStyle(fontWeight: FontWeight.bold,
                            color: AppColors.white,
                            fontSize: 16, ),)],), ),
                      ), 
                    ],
                  ), const SizedBox(height: 10,),
               controller.statusRequest == StatusRequest.sucsses ?
               ListView.builder( physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.reviews.length,
                    itemBuilder: (context, i) => ReviewCard(review: controller.reviews[i], 
                    edit: (comment, rating, id){controller.editReview(comment, rating, id);}, 
                    delete: (id){controller.deletReview(id);},
                    item: controller.item,
                    ),) : 
                    Center(child: Lottie.asset(AppImages.loadingImage, width: 180, height: 190))
                    , const SizedBox(height: 10,)
                ],
              ),
            ),
              ],
            );
        }
      ),
      bottomNavigationBar: Container(color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: GetBuilder<ItemInformationcontroller>(
        builder: (controller) =>
           Column( 
            mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
            children: [ SizedBox(height: 6,),
            Row(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                fullPriceInfo(controller.oldPrice, controller.price
                , 16, 24) ,
      const Spacer(),  cartIconButton((){controller.toCart();})
                
                ],), const SizedBox(height: 10,),
       Row(children: [amountController(42, 118, 16, 22, controller.amount, (){controller.remove();}, (){controller.add();}), 
       const Spacer(),  SizedBox( height: 43, width: 180,
      child: ElevatedButton.icon( style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(AppColors.organgeYellow),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),), ),),
                      onPressed: () { controller.addToCart();},
                      label: const Text("Add to cart",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 21,),),
                      icon: const Icon(FontAwesomeIcons.cartShopping, color: AppColors.white, size: 15,),
                      iconAlignment: IconAlignment.end,
              ),
            ),
                ],), SizedBox(height: 8,)],)
      ),
      ),
    );
  }

}