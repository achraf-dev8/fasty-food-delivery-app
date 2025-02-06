import 'package:fasty/Controller/account/orders/current_orders_conroller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/View/Screens/account/orders/orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CurrentOrders extends GetView<CurrentOrdersConroller> {

  const CurrentOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CurrentOrdersConroller());
    return Scaffold(
      body: RefreshIndicator(
      color: AppColors.blue,
      strokeWidth: 3,
      onRefresh: () async{ //await controller.getData();
      },
        child: GetBuilder<CurrentOrdersConroller>(
          builder: (controller) => Orders(title: "Current Orders", orders: controller.currentOrders, cancel: (val){controller.cancel(val);},
            )
        ),
      ) 
    );}
}
