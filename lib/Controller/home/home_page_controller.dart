import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/change_favorite.dart';
import 'package:fasty/Core/Functions/search_sort.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/Data/DataSource/Remote/home/cart.dart';
import 'package:fasty/Data/DataSource/Remote/home/favorite.dart';
import 'package:fasty/Data/Model/item_model.dart';
import 'package:fasty/Data/Model/offer_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePagecontroller extends GetxController{
CartData cartData = CartData(Get.find());
FavoriteData favoriteData = FavoriteData(Get.find());
final int animDration = 400;
late PageController pgController;
int offerPage = 0;
 List<ItemModel> allItems = [];
 List<ItemModel> searchedItems = [];
List<ItemModel> mostPopularList = [];
List<ItemModel> newestList = [];
List<int> favorite = [];
bool emptySearch = true;
String searxhText = "";
void Function(int) toCategory = (id){};


@override
  void onInit() {
    pgController = PageController();
    favorite = AllData().favorite;
    allItems = AllData().items;
    allItems.sort((a, b) => b.rating!.compareTo(a.rating!));
    mostPopularList = allItems.take(7).toList();
    allItems.sort((a, b) => DateTime.parse(b.date!).compareTo(DateTime.parse(a.date!)));
    newestList = allItems.take(7).toList();
    globalSort(allItems);
    update();
    super.onInit();
  }

onPageChanged(int val){
  offerPage=val;
  update();
}

  changeFavorite(int item) {
  String state = checkFavorite(item) ? "remove": "add";
  globalChangeFavorite(item);
  favoriteData.postData(item, state);
  update();
}

    search(String val){
      searxhText = val;
      searchedItems = globalSearch(val, allItems);
      emptySearch = listEquals(searchedItems, allItems);
      update();
    }
    
    sort(){
      allItems = globalSort(allItems);
      search(searxhText);
    }

    offerClick(OfferModel offer){
      if(offer.clickable == 1){
        Get.toNamed(AppRoutes.itemInformation, arguments: {"item" : AllData().items.firstWhere((item)=> item.id == offer.item)});
      }else{
        
       toCategory(offer.category!);
      }
    }
}

