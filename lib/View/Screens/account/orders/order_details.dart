


import 'package:fasty/Controller/account/orders/order_details_controller.dart';
import 'package:fasty/View/Screens/error/handling-request-view.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Classes/order_details_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends GetView<OrderDetailsController> {
  const OrderDetails({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> OrderDetailsController());
    return Scaffold(
      body:
        GetBuilder<OrderDetailsController>( builder: (controller) =>
          authPadding(
           HandlingRequestView( statusRequest: controller.statusRequest, update: (){controller.updateStatusRequest();},
             widget: ListView(children: [
                Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                textBackButtonAppBar(context, "Order Details"),
                SizedBox(height: 10,),
                  ListView.builder(
                    shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                   itemCount: controller.cart.length,
                itemBuilder: (context, i) => OrderDetailsCard(cart: controller.cart[i], extras: controller.extras[i],)
                ),
                  ],
                )
              
                ],),
           ))),);
            
              
  }

  Widget test(){
    return Container();
  }
}