
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/home/review.dart';
import 'package:fasty/Data/Model/review_model.dart';
import 'package:fasty/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController{
     int rating = 5;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController comment = TextEditingController();
    ReviewData reviewData = ReviewData(Get.find());
      changeRating(int i){
      rating = i;
      update();
    }

      @override
  void dispose() {
    comment.dispose();
    super.dispose();
  }

    add(int item, String comment, void Function(ReviewModel) itemInfo) async{
      if(formKey.currentState!.validate()){
       var response = await reviewData.addReview(rating, comment, item);

       StatusRequest statusRequest = handlingData(response);
       if(statusRequest == StatusRequest.sucsses){
        int id = int.parse(response["id"]);
        itemInfo(ReviewModel(rating: rating, comment: comment, item: item, date: DateTime.now().toString(),
        name: "${sharedPrefs.getString("first_name")} ${sharedPrefs.getString("last_name")}", 
        id: id, user: sharedPrefs.getInt("id")
        
        ));
       }
       Get.back();
      }
    }

      edit(int id, String comment, int item, 
      void Function(String, int, int) itemInfo) async{
      if(formKey.currentState!.validate()){
        await reviewData.editReview(item, id, rating, comment);
        itemInfo(comment, rating, id);
         Get.back();
      }
    }

}