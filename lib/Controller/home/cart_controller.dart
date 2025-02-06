
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/change_favorite.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/Data/DataSource/Remote/home/cart.dart';
import 'package:fasty/Data/DataSource/Remote/home/favorite.dart';
import 'package:fasty/Data/Model/cart_extra_model.dart';
import 'package:fasty/Data/Model/cart_model.dart';
import 'package:fasty/Data/Model/extra_model.dart';
import 'package:fasty/Data/Model/item_extra_model.dart';
import 'package:fasty/Data/Model/item_model.dart';
import 'package:fasty/Data/Model/item_size_model.dart';
import 'package:fasty/View/Widgets/Functions/dialogs.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  FavoriteData favoriteData = FavoriteData(Get.find());
  CartData cartData = CartData(Get.find());
  List<ItemModel> realItems = [];
  List<CartModel> items = [];
  List<ItemSizeModel> itemSizes = [];
  List<ItemExtraModel> itemExtras = [];
  List<CartExtraModel> cartExtras = [];
  List<ExtraModel> extras = [];
  List<int> selectedItems = [];
  bool allSelected = true;
  double totalOldPrice =0;
  double totalPrice =0;
  
  @override
  void onInit(){
    items = AllData().cart;
    itemSizes = AllData().itemSizes;
    itemExtras = AllData().itemExtras;
    realItems = AllData().items;
    cartExtras = AllData().cartExtras;
    extras = AllData().extras;
    AllData().cartBool = 0;
    cartData.noCart();
    fillAllSelectedItems();
    countPrice();
    super.onInit();
  }
  

  changeFavorite(int item) {
  String state = checkFavorite(item) ? "remove": "add";
  globalChangeFavorite(item);
  favoriteData.postData(item, state);
  update();
}

int getItemId(CartModel cartItem){
  return itemSizes.firstWhere((itemSize) => itemSize.id! == cartItem.itemSize).item!;
}

showDeleteDialog(){
  deleteDialog("Are you sure you want to remove ${selectedItems.length} items?", ()async {Get.back();
    await delete();});
}

delete() async{
  List<CartModel> removedItems= items.where((item) => selectedItems.contains(items.indexOf(item))).toList();
  List<String> removedIds= removedItems.map((item) => item.id!.toString()).toList();
  items.removeWhere((item)=>removedItems.contains(item));
  AllData().cart = items;
  selectedItems = []; 
  countPrice();
  update();
  await cartData.deleteCart(removedIds);
}
  add(int i){ 
    items[i].amount=items[i].amount!+1;
    updateAmount(i);
    
  }
  remove(int i){
    if(items[i].amount!>1){
    items[i].amount=items[i].amount!-1;
    updateAmount(i);
    }
    }

    updateAmount(int i){
    AllData().cart = items;
    countPrice();
    update();
    cartData.updateCart(items[i].id!, items[i].amount!);

    }

    fillAllSelectedItems(){
       int i = -1;
        selectedItems = items.map((cartItem){i++; return i;}).toList();
    }

    selectAll(){
      if(selectedItems.length == items.length){
        selectedItems = [];
      }else{
        fillAllSelectedItems();
      }
      allSelected = !allSelected;
      countPrice();
      update();
    }

    selectItem(int i){
      if(selectedItems.contains(i)){
        selectedItems.remove(i);
      }else{
        selectedItems.add(i);
      }
      if(selectedItems.length == items.length){
        allSelected = true;
      }else{
        allSelected = false;
      }
      countPrice();
      update();
    }

    countPrice(){
  totalOldPrice = selectedItems.map((i){return itemSizes.firstWhere
  ((itemSize) => itemSize.id == items[i].itemSize).oldPrice!*items[i].amount!;}).
  toList().fold(0.0, (previousValue, element) => previousValue + element);

    totalPrice = selectedItems.map((i){return itemSizes.firstWhere
  ((itemSize) => itemSize.id == items[i].itemSize).price!*items[i].amount!;}).
  toList().fold(0.0, (previousValue, element) => previousValue + element);
    }

  String getExtras(int i){

   List<CartExtraModel> itemCartExtras = cartExtras.where((cartExtra) => cartExtra.cart == items[i].id).toList();
   if(itemCartExtras.isEmpty)return "";
   List<ExtraModel> itemExtras = itemCartExtras.map((cartExtra)=> extras.firstWhere((extra)=>extra.id == cartExtra.extra)).toList();
   List<String> extrasNames = itemExtras.map((extra)=>extra.name!).toList();
   return extrasNames.join(', ');
  }

  toCheckout(){
    getTotalPrice();
    List<CartModel> cart = selectedItems.map((i)=>items[i]).toList();
    Get.toNamed(AppRoutes.checkout, 
                  arguments: {"price" : totalPrice, "cart" : cart} 
                  );
  }

  getTotalPrice(){
  
  // Convert to string and split at the decimal point
  String valueString = totalPrice.toString();
  int decimalIndex = valueString.indexOf('.');
  
  // Get the substring of the first two digits after the decimal
  String firstTwoDigits = decimalIndex != -1 && decimalIndex + 2 < valueString.length
      ? valueString.substring(decimalIndex + 1, decimalIndex + 3)
      : '00'; // Default to '00' if there aren't two digits
  
  // Convert the substring back to double
  totalPrice = double.parse('${valueString.substring(0, decimalIndex + 1)}$firstTwoDigits'); 
  }
    

}