

import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Constant/apilinks.dart';
import 'package:fasty/main.dart';

class ReviewData{
  Crud crud;
  ReviewData(this.crud);
  
  showReviews(int item) async{
  return await crud.postRequest(ApiLinks.showReviewsLink, {
    "item" : item.toString(),
    });
  }

  addReview(int rating, String comment, int item) async{
    return await crud.postRequest(ApiLinks.addReviewLink, {
    "user" : sharedPrefs.getInt("id").toString(),
  "rating" :rating.toString(),
  "comment" : comment,
  "item" : item.toString(),
    });
  }

  editReview(int item, int id, int rating, String comment) async{
  return await crud.postRequest(ApiLinks.editReviewLink, {
  "id" : id.toString(),
  "item" : item.toString(),
  "rating" :rating.toString(),
  "comment" : comment,
    });
}

  deleteReview(int id, int item) async{
   await crud.postRequest(ApiLinks.deleteReviewLink, {
  "id" : id.toString(),
  "item" : item.toString()
  });
}

}