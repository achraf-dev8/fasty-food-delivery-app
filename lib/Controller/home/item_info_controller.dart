
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/add_check_snack_bar.dart';
import 'package:fasty/Core/Functions/add_to_cart.dart';
import 'package:fasty/Core/Functions/change_favorite.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/Data/DataSource/Remote/home/cart.dart';
import 'package:fasty/Data/DataSource/Remote/home/favorite.dart';
import 'package:fasty/Data/DataSource/Remote/home/review.dart';
import 'package:fasty/Data/Model/cart_extra_model.dart';
import 'package:fasty/Data/Model/review_model.dart';
import 'package:fasty/Data/Model/cart_model.dart';
import 'package:fasty/Data/Model/extra_model.dart';
import 'package:fasty/Data/Model/item_extra_model.dart';
import 'package:fasty/Data/Model/item_model.dart';
import 'package:fasty/Data/Model/item_size_model.dart';
import 'package:fasty/Data/Model/size_model.dart';
import 'package:fasty/main.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ItemInformationcontroller extends GetxController{
  
  CartData cartData = CartData(Get.find());
  ReviewData reviewData = ReviewData(Get.find());
  FavoriteData favoriteData = FavoriteData(Get.find());
  List<SizeModel> sizes = [];
  List<CartModel> allCartItems = [];
  List<ItemSizeModel> itemSizes = [];
  List<ExtraModel> extras = [];
  int selectedSizePosition = 0;
  List<int> selectedExtrasPositions = [];
  List<int> selectedExtrasIds = [];
  double oldPrice = 0;
  double price =0;
  int amount =1;
  bool favorite = false;
  StatusRequest statusRequest = StatusRequest.loading;
  ItemModel item = ItemModel(name: "", description: "", rating :0);
  List<ReviewModel> reviews = [];
  int hasReview = 0;


    @override
  void onReady() async{
    item = Get.arguments["item"];
    favorite = checkFavorite(item.id!);
    itemSizes = AllData().itemSizes.where((element) => element.item == item.id).toList();
    allCartItems = AllData().cart; 
    selectedSizePosition = itemSizes.indexOf(itemSizes.firstWhere((itemSize) => itemSize.id == getMainItemSize(item).id));
    if(itemSizes[0].main != 0){
          sizes = itemSizes.map((itemSize) {
  SizeModel size = AllData().sizes.firstWhere((size) => size.id == itemSize.size);
  return size;
}).toList();
}



oldPrice = itemSizes[selectedSizePosition].oldPrice!;
price = itemSizes[selectedSizePosition].price!;

    List<ItemExtraModel> itemExtras = AllData().itemExtras.where((element) => element.item == item.id).toList();
    extras = itemExtras.map((itemExtra) {
  ExtraModel extra = AllData().extras.firstWhere((extra) => extra.id == itemExtra.extra);
  return extra;
}).toList();
    update();
    //reviews
    var response = await reviewData.showReviews(item.id!);
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.sucsses){
       ReviewModel review;
      for(int i=0; i<response["reviews"].length ; i++){

         review = ReviewModel.fromJson(response["reviews"][i]);
        reviews.insert(hasReview, review);
        if(review.user == sharedPrefs.getInt("id")){
          hasReview = 1;
        }
      }
    }else{
      statusRequest = StatusRequest.loading;
    }
    update();
    super.onReady();
  }

  changePrices(){
    oldPrice = itemSizes[selectedSizePosition].oldPrice! * amount;
price = itemSizes[selectedSizePosition].price! * amount;
  }

  selectingSize(int position, int id){
    selectedSizePosition = position;
    changePrices();
    update();
  }

  changeSelectedExtra(int position, int id){
    if(!selectedExtrasPositions.contains(position)){
    selectedExtrasPositions.add(position);
    }else{
    selectedExtrasPositions.remove(position);
    }
    update();
  }

  add(){
    amount++;
    changePrices();
    update();
  }
  remove(){
        if(amount > 1){
          amount--;
          changePrices();
          update();
    } }
    changeFavorite(){
      if(favorite){
        AllData().favorite.remove(item.id!);
      }else{
        AllData().favorite.add(item.id!);
      }
      favorite = !favorite;
      favoriteData.postData(item.id!, favorite ? "add" : "remove");
      update();
    }

    addToCart() async{
      
      CartModel cart = CartModel();
      List<CartModel> cartItems = allCartItems.where((cart) => cart.itemSize == itemSizes[selectedSizePosition].id).toList();
      selectedExtrasIds = selectedExtrasPositions.map((position) => extras[position].id!).toList();
      for(CartModel cartItem in cartItems){
        List<CartExtraModel> cartExtras = AllData().cartExtras.where((cartExtra)=> cartExtra.cart == cartItem.id).toList();
        List<int> extrasIds = cartExtras.map((cartExtra) => cartExtra.extra!).toList();
        if(listEquals(selectedExtrasIds, extrasIds)){
          cart = cartItem;
          break;
        }
        
      }
      
      if(cart.id != null){
        
        allCartItems.firstWhere((cartCheck) {
          if(cart.id == cartCheck.id){
            
            cartCheck.amount = cartCheck.amount! + amount;
            cart.amount = cartCheck.amount;
            return true;
          }
          return false;
          
        });
        cartData.updateCart(cart.id!, cart.amount!);
        showSnackBar();
      }else{ 
      var response = await cartData.addCart(amount, itemSizes[selectedSizePosition].id!, selectedExtrasIds);
     StatusRequest statusRequest = handlingData(response);

      if(addCheck(statusRequest)){
        int id= int.parse(response["id"]);  
        cart = CartModel(id: id, itemSize: itemSizes[selectedSizePosition].id!, amount: amount);
        allCartItems.add(cart);
        //AllData().cart.add(cart);
        
        for(int i=0; i<selectedExtrasIds.length; i++){
        AllData().cartExtras.add(CartExtraModel(cart: id, extra: selectedExtrasIds[i]));
        }
        showSnackBar();
        AllData().cartBool = 1;
        update();
      }


      }
    }

    showSnackBar(){
        String was = amount==1 ? "was" : "were";
        Get.showSnackbar( GetSnackBar(message: "$amount ${item.name} $was added to cart", 
        duration: const Duration(milliseconds: 1850),));
    }

    toCart(){
    if(AllData().cartBool == 1){
    cartData.noCart();
    update(); 
    }
    Get.toNamed(AppRoutes.cart);
  
    }

    //reviews

    addReview(ReviewModel review){
        reviews.insert(0, review);
        hasReview= 1;
        AllData().reviews.insert(0, review);
        update();
    }

    editReview(String comment, int rating, int id){
        reviews.firstWhere((review)=>review.id == id).comment = comment;
        reviews.firstWhere((review)=>review.id == id).rating = rating;
        AllData().reviews.firstWhere((review)=>review.id == id).comment = comment;
        AllData().reviews.firstWhere((review)=>review.id == id).rating = rating;
        update();
    }

    deletReview(int id) async{
      await reviewData.deleteReview(id, item.id!);
      reviews.removeWhere((review)=> review.id == id);
      hasReview = 0;
      AllData().reviews.removeWhere((review)=> review.id == id);
      update();
    }

}

