import 'package:fasty/Core/Functions/change_favorite.dart';
import 'package:fasty/Core/Functions/search_sort.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/Data/DataSource/Remote/home/cart.dart';
import 'package:fasty/Data/DataSource/Remote/home/favorite.dart';
import 'package:fasty/Data/Model/item_model.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController{
  FavoriteData favoriteData = FavoriteData(Get.find());
  CartData cartData = CartData(Get.find());
  List<ItemModel> items = [];
  List<ItemModel> searchedItems = [];
  String searxhText = "";
  @override
  void onInit(){
    items = AllData().items.where((item) => checkFavorite(item.id!)).toList();
    searchedItems = items;
    super.onInit();
  }

  changeFavorite(int item) {
  String state = checkFavorite(item) ? "remove": "add";
  globalChangeFavorite(item);
  favoriteData.postData(item, state);
  update();
}

    search(String val){
      searxhText = val;
      searchedItems = globalSearch(val, items);
      update();
    }
        sort(){
      items = globalSort(items);
      search(searxhText);
    }


}