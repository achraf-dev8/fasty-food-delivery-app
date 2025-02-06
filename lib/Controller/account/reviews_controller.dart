
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/Data/DataSource/Remote/home/review.dart';
import 'package:fasty/Data/Model/item_model.dart';
import 'package:fasty/Data/Model/review_model.dart';
import 'package:get/get.dart';

class ReviewsController extends GetxController{
  ReviewData reviewData = ReviewData(Get.find());


      deletReview(int id) async{
      await reviewData.deleteReview(id, AllData().reviews.firstWhere((review)=> review.id == id).item!);
      AllData().reviews.removeWhere((review)=> review.id == id);
      update();
    }

    editReview(String comment, int rating, int id){
        AllData().reviews.firstWhere((review)=>review.id == id).comment = comment;
        AllData().reviews.firstWhere((review)=>review.id == id).rating = rating;
        update();
    }

    getFullReview(ReviewModel review){
      review.name = AllData().items.firstWhere((item)=> item.id == review.item).name;
      return review;
    }

    toItemInfo(int itemId){
      ItemModel item = AllData().items.firstWhere((item)=> item.id == itemId);
      Get.toNamed(AppRoutes.itemInformation, arguments: {"item" : item});
    }

}