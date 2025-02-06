

import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Constant/apilinks.dart';

class OrderDetailsData{
  Crud crud;
  OrderDetailsData(this.crud);


  postData(int order) async{
  return await crud.postRequest(ApiLinks.orderDetailsLink, {
    "order" : order.toString(),
  });
}

}