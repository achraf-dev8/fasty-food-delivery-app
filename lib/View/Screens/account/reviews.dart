


import 'package:fasty/Controller/account/question_controller.dart';
import 'package:fasty/Controller/account/reviews_controller.dart';
import 'package:fasty/Controller/home/review_dialog_controller.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Classes/question_column.dart';
import 'package:fasty/View/Widgets/Classes/review_card.dart';
import 'package:fasty/View/Widgets/Classes/search_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reviews extends GetView<ReviewController> {
  const Reviews({super.key});
  @override
  Widget build(BuildContext context) {
    
    Get.lazyPut(()=> ReviewsController());
    
    return Scaffold(
      
      body:
            ListView(children: [
            authPadding(Column( 
              children: [
            textBackButtonAppBar(context, "Reviews"),
            const SizedBox(height: 28,),
            GetBuilder<ReviewsController>(builder: (controller) => ListView.builder(shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), itemCount: 
            AllData().reviews.length, itemBuilder: (context, i)=> 
            ReviewCard(review: controller.getFullReview(AllData().reviews[i]), edit: (comment, rating, id){controller.editReview(comment, rating, id);},
            delete: (id){controller.deletReview(id);}, item: AllData().items.firstWhere((item)=>AllData().reviews[i].item == item.id), 
            onPressed: (){controller.toItemInfo(AllData().reviews[i].item!);},
            )
            ,))
            
             
              ],
            ))
          
            ]),
    );
    
  } }


  Widget test(){
    return Container();
  }
