
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/home/notifications.dart';
import 'package:fasty/Data/Model/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController{

  NotificationsData notificationsData = NotificationsData(Get.find());
  List<NotificationModel> notifications = [];
  StatusRequest statusRequest = StatusRequest.sucsses;
  
  @override
  void onInit()async{
    await getData();
    super.onInit();
  }

     getData() async{
    notifications = [];
    if(statusRequest != StatusRequest.loading){
    statusRequest = StatusRequest.loading;
    update();
    }
    var response = await notificationsData.showNotifications();
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.sucsses){
      for(int i=0; i<response["notifications"].length ; i++){
        notifications.insert(0, NotificationModel.fromJson(response["notifications"][i]));
      }
    }
    update();
  }

  }
  



