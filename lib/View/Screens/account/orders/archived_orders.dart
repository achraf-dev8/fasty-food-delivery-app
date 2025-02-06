import 'package:fasty/Controller/account/orders/archived_orders_conroller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/View/Screens/account/orders/orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchivedOrders extends GetView<ArchivedOrdersConroller> {

  const ArchivedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ArchivedOrdersConroller());
    return Scaffold(

      body: RefreshIndicator(
      color: AppColors.blue,
      strokeWidth: 3,
      onRefresh: () async{ await controller.getData();},
      child: GetBuilder<ArchivedOrdersConroller>(
     builder: (context) => Orders(title: "Archived Orders", orders: controller.archivedOrders, cancel: (val){controller.cancel(val);},) 
        ),
      ),
    );}
}
