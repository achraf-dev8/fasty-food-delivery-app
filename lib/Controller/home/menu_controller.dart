

import 'package:fasty/Core/Functions/change_favorite.dart';
import 'package:fasty/Core/Functions/search_sort.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/Data/DataSource/Remote/home/cart.dart';
import 'package:fasty/Data/DataSource/Remote/home/favorite.dart';
import 'package:fasty/Data/Model/category_model.dart';
import 'package:fasty/Data/Model/item_model.dart';
import 'package:get/get.dart';

class Menucontroller extends GetxController{
  FavoriteData favoriteData = FavoriteData(Get.find());
  CartData cartData = CartData(Get.find());
  int selectedCategoryPosition = 0;
  late int selectedCategoryId;
  bool changedCategory = false;
  List<CategoryModel> categories = [];
  List<ItemModel> items = [];
  List<ItemModel> searchedItems = [];
  String searxhText = "";
  
  @override
  void onReady() {
    categories = AllData().categories;
    if(changedCategory){
      selectedCategoryPosition = categories.indexOf(categories.firstWhere((cat)=>cat.id == selectedCategoryId));
    }
    changeSelectedItemsCat();
    update();
    super.onReady();
  }

  changeSelected(int position, int id){
    selectedCategoryPosition = position;
    changeSelectedItemsCat();
    update();
  }

  changeSelectedItemsCat(){
    selectedCategoryId = categories[selectedCategoryPosition].id!;
    items = AllData().items.where((item)=>item.category == selectedCategoryId).toList();
    searchedItems = globalSearch(searxhText, items);
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