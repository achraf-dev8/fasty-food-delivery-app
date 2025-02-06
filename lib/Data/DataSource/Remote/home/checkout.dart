

import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Constant/apilinks.dart';
import 'package:fasty/main.dart';

class CheckoutData{
  Crud crud;
  CheckoutData(this.crud);
  postData(String address, double price, double deliveryPrice, String deliveryTime, String payementMethode, List<int> cart,
  List<String> sizes, List<double> prices, List<String> images, List<String> names
  ) async{
    Map<String, String> map = {
    "user" : sharedPrefs.getInt("id").toString(),
    "address" : sharedPrefs.getInt("id").toString(),
    "price" : price.toString(),
    "delivery_price" : deliveryPrice.toString(),
    "delivery_time" : deliveryTime,
    "payement_method" : payementMethode,
    };

    for(int i = 0; i<cart.length; i++){
      map["cart[$i]"] = cart[i].toString();
      map["prices[$i]"] = prices[i].toString();
      map["sizes[$i]"] = sizes[i];
      map["images[$i]"] = images[i];
      map["names[$i]"] = names[i];
    }   

    var response = await crud.postRequest(ApiLinks.addOrderLink, map);
    return response;
  }
}