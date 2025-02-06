

import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Constant/apilinks.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/Data/Model/address_model.dart';
import 'package:fasty/Data/Model/cart_extra_model.dart';
import 'package:fasty/Data/Model/cart_model.dart';
import 'package:fasty/Data/Model/category_model.dart';
import 'package:fasty/Data/Model/extra_model.dart';
import 'package:fasty/Data/Model/item_extra_model.dart';
import 'package:fasty/Data/Model/item_model.dart';
import 'package:fasty/Data/Model/item_size_model.dart';
import 'package:fasty/Data/Model/offer_model.dart';
import 'package:fasty/Data/Model/question_model.dart';
import 'package:fasty/Data/Model/review_model.dart';
import 'package:fasty/Data/Model/size_model.dart';
import 'package:fasty/main.dart';

class HomeData{
  Crud crud;
  HomeData(this.crud);
 Future<StatusRequest> getAllData() async{

    var response = await crud.postRequest(ApiLinks.allDataLink, {"id" : sharedPrefs.getInt("id").toString()});
    StatusRequest statusRequest = handlingData(response);
    if(StatusRequest.sucsses == statusRequest){
      AllData().restart();
      for(int i=0; i<response["categories"].length ; i++){
        AllData().categories.add(CategoryModel.fromJson(response["categories"][i]));
      }
      for(int i=0; i<response["items"].length ; i++){
        AllData().items.add(ItemModel.fromJson(response["items"][i]));
      }
       for(int i=0; i<response["extras"].length ; i++){
        AllData().extras.add(ExtraModel.fromJson(response["extras"][i]));
      }
      for(int i=0; i<response["sizes"].length ; i++){
        AllData().sizes.add(SizeModel.fromJson(response["sizes"][i]));
      }
      for(int i=0; i<response["item_size"].length ; i++){
        AllData().itemSizes.add (ItemSizeModel.fromJson(response["item_size"][i]));
      } 
      for(int i=0; i<response["item_extra"].length ; i++){
        AllData().itemExtras.add (ItemExtraModel.fromJson(response["item_extra"][i]));
      } 
      for(int i=0; i<response["favorite"].length ; i++){
        AllData().favorite.add (response["favorite"][i]["item"]);
      } 

      for(int i=0; i<response["cart"].length ; i++){
        AllData().cart.add (CartModel.fromJson(response["cart"][i]));
      }

      for(int i=0; i<response["cart_extra"].length ; i++){
        print(sharedPrefs.getInt("id").toString());
       AllData().cartExtras.add (CartExtraModel.fromJson(response["cart_extra"][i]));
      }
      for(int i=0; i<response["addresses"].length ; i++){
        AllData().addresses.add (AddressModel.fromJson(response["addresses"][i]));
      }
      for(int i=0; i<response["faq"].length ; i++){
        AllData().questions.add (QuestionModel.fromJson(response["faq"][i]));
      }
      
      for(int i=0; i<response["reviews"].length ; i++){
        AllData().reviews.insert (0, ReviewModel.fromJson(response["reviews"][i]));
      }

      for(int i=0; i<response["offers"].length ; i++){
        AllData().offers.add(OfferModel.fromJson(response["offers"][i]));
      }
      AllData().notification =  response["notification"];
      AllData().cartBool =  response["cartBool"];
      }

      return statusRequest;
  }
}
