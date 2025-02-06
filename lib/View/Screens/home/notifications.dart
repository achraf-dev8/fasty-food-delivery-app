


import 'package:fasty/Controller/home/notification_controller.dart';
import 'package:fasty/View/Screens/error/handling-request-view.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Classes/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifications extends GetView<NotificationController> {
    const Notifications({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return GetBuilder<NotificationController>(
      builder: (controller) {
        return Scaffold( 
          body:HandlingRequestView(update: ()async{await controller.getData();}, 
          statusRequest: controller.statusRequest, widget: SafeArea(
            child: authPadding(
              ListView(children: [ globalButtonAppBar(context, "Notifications", 19, 37, 10, 22),
              const SizedBox(height: 15),
              ListView.builder(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.notifications.length,
              itemBuilder: (context, i)=>NotificationCard(notification: controller.notifications[i],),

              ) 
                          ],), 
                         
                          ),
          ),)
        );
      }
    );
  }

}