
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/account/show_order.dart';
import 'package:fasty/Data/DataSource/Remote/account/order.dart';
import 'package:fasty/Data/Model/order_model.dart';
import 'package:fasty/View/Widgets/Functions/dialogs.dart';
import 'package:get/get.dart';

class ArchivedOrdersConroller extends GetxController{
  OrderData orderData = OrderData(Get.find());
  ShowOrderData showOrderData = ShowOrderData(Get.find());
  List<OrderModel> archivedOrders = [];
  StatusRequest statusRequest = StatusRequest.sucsses;
  @override
  void onInit()async{
    await getData();
    super.onInit();
  }

     getData() async{
    archivedOrders = [];
    if(statusRequest != StatusRequest.loading){
    statusRequest = StatusRequest.loading;
    update();
    }
    var response = await showOrderData.showArchived();
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.sucsses){
      for(int i=0; i<response["orders"].length ; i++){
        archivedOrders.insert(0, OrderModel.fromJson(response["orders"][i]));
      }
    }
    update();
     
  }

    cancel(int id){
    orderDialog("Are you sure you want to cancel this order?", ()async{Get.back(); await cancelConfirm(id);});
  }

  cancelConfirm(int id)async{
    statusRequest = StatusRequest.loading;
    update();
    var response = await orderData.cancelOrder(id);
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.sucsses){
      await getData();
    }else{
      update();
    } 
  }
  }
  



