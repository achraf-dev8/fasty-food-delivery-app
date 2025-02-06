

import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Constant/apilinks.dart';
import 'package:fasty/main.dart';

class CartData{
  Crud crud;
  CartData(this.crud);
  deleteCart(List<String> ids) async{
    return await crud.postRequest(ApiLinks.deleteCartLink, {
    "ids" : ids.toString(),
    });
  }
  updateCart(int id, int amount) async{
  return await crud.postRequest(ApiLinks.updateCartLink, {
  "user" : sharedPrefs.getInt("id").toString(),
  "id" : id.toString(),
  "amount" :amount.toString(),
    });
}

  addCart(int amount, int itemSize, List<int> extraList) async{
  return await crud.postRequest(ApiLinks.addCartLink, {
  "user" : sharedPrefs.getInt("id").toString(),
  "amount" :amount.toString(),
  "item_size" : itemSize.toString(),
  "extras" : extraList.toString(),
  });

}

  noCart() async{
  return await crud.postRequest(ApiLinks.noCartLink, {
  "user" : sharedPrefs.getInt("id").toString(),
  });
}

}