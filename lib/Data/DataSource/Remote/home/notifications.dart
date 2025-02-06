

import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Constant/apilinks.dart';
import 'package:fasty/main.dart';

class NotificationsData{
  Crud crud;
  NotificationsData(this.crud);

  showNotifications() async{
    return await crud.postRequest(ApiLinks.notificationsLink, {
    "user" : sharedPrefs.getInt("id").toString(),
    });
  }

}