

import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Constant/apilinks.dart';
import 'package:fasty/Data/Model/order_model.dart';

class OrderData{
  Crud crud;
  OrderData(this.crud);

  cancelOrder(int id) async{
    return await crud.postRequest(ApiLinks.cancelOrderLink, {
    "id" : id.toString(),
    });
  }

  addOrder(OrderModel order) async{
  return await crud.postRequest(ApiLinks.addOrderLink, order.toJson());
}

}