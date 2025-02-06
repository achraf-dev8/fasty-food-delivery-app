import 'package:fasty/Controller/home/home_controller.dart';
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Functions/add_check_snack_bar.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/Data/DataSource/Remote/home/cart.dart';
import 'package:fasty/Data/Model/cart_extra_model.dart';
import 'package:fasty/Data/Model/cart_model.dart';
import 'package:fasty/Data/Model/item_model.dart';
import 'package:fasty/Data/Model/item_size_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

  ItemSizeModel getMainItemSize(ItemModel item){

    List<ItemSizeModel> itemSizes = AllData().itemSizes.where((itemS)=>itemS.item == item.id).toList();
    if(itemSizes[0].main == 0){
      return itemSizes[0];
    }
      return itemSizes.firstWhere((itemS)=>itemS.main == 1);

     
  }
   addOneToCart(ItemModel item, CartData cartData) async{

      CartModel cart = CartModel();
      ItemSizeModel itemSize = getMainItemSize(item);
      List<CartModel> cartItems = AllData().cart.where((cart) => cart.itemSize == itemSize.id).toList();
      
      for(CartModel cartItem in cartItems){
        List<CartExtraModel> cartExtras = AllData().cartExtras.where((cartExtra)=> cartExtra.cart == cartItem.id).toList();
        if(listEquals(cartExtras, [])){
          cart = cartItem;
          break;
        }
      }      
      if(cart.id != null){
        AllData().cart.firstWhere((cartCheck) {
          if(cart.id == cartCheck.id){
            cartCheck.amount = cartCheck.amount! + 1;
            return true;
          }
          return false;
          
        });

        cartData.updateCart(cart.id!, cart.amount!);
        showSnackBar(item);
      }else{       
      var response = await cartData.addCart(1, itemSize.id!, []);
     StatusRequest statusRequest = handlingData(response);

      if(addCheck(statusRequest)){
        int id= int.parse(response["id"]);  
        cart = CartModel(id: id, itemSize: itemSize.id, amount: 1);
        AllData().cart.add(cart);
        showSnackBar(item);     
        } 
    }
    AllData().cartBool = 1;
    Homecontroller controller = Get.find();
    controller.update();
   }

showSnackBar(ItemModel item){
        Get.showSnackbar( GetSnackBar(message: "1 ${item.name} was added to cart", 
        duration: const Duration(milliseconds: 1500),));
}
