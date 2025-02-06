import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Data/Model/order_model.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrderCard extends StatelessWidget {
  
  final OrderModel order;
  final void Function(int) cancel;
  const OrderCard({super.key, required this.order, required this.cancel});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: InkWell(
          overlayColor: WidgetStateProperty.all<Color>(AppColors.buttonSplash),
          borderRadius: BorderRadius.circular(10),
          onTap: (){Get.toNamed(AppRoutes.orderDetails, arguments: order.id!);},
          child: Expanded(
            child: SizedBox(
              width: 290,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.2, right: 8.2, top: 12),
                    child: Row(
                      children: [
                        Text("Order Number #${order.id}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17.25),),
                        const Spacer(),
                        Text(Jiffy.parse(order.date!).fromNow(), style: const TextStyle(fontSize: 16.25, color: AppColors.darkGrey)),
                      ],
                    ),
                  ),
                  const Divider(color: AppColors.softGrey,), Padding(
                    padding: const  EdgeInsets.only(left: 8.2, right: 8.2, bottom: 12),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                      Text("Adress : ${order.address}", 
                      style: const TextStyle(fontSize: 20),),
                     Text("Order Price : ${order.price}\$", style: const TextStyle(fontSize: 20)),
                     Text("Shipping Price : ${order.deliveryPrice}\$", style: const TextStyle(fontSize: 20),),
                     Text("Total Price : ${order.price! + order.deliveryPrice!}\$", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                     Text("Payement Method : ${order.payementMethod}", style: const TextStyle(fontSize: 20),),
                     Text("Delivery Time : ${order.deliveryTime}", style: const TextStyle(fontSize: 20),),
                     Text("Status : ${order.state == -1 ? "Disapproved" :
                      order.state == 0 ? "Pending Approval" : order.state == 1 ? "Approved"
                     : order.state == 2 ? "In Delivery" : "Delivered"
                     }", style: const TextStyle(fontSize: 20),),

                      Visibility(visible: order.state == -1 && order.disapprovementMsg!.isNotEmpty,
                        child: Text("Reason : ${order.disapprovementMsg}", style: const TextStyle(fontSize: 20),)),
                     const SizedBox(height: 10,), order.state == 0 ?
                     
                     orderButton(AppColors.lightRed, "Cancel", (){cancel(order.id!);}) : const SizedBox(),
                    ],),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }



}