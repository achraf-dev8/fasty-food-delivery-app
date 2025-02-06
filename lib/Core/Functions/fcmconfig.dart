
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';


requestNotificationPermisson()async{
await FirebaseMessaging.instance.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);
}



fcmconfig() {
  FirebaseMessaging.onMessage.listen((message)async{
    if(message.notification!.body != "Your order is pending approval"){
      Get.snackbar(message.notification!.title!, message.notification!.body!, duration: const Duration(milliseconds: 2800));
    }
   AllData().notification = 1;
  });
}