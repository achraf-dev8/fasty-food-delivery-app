

import 'package:fasty/Data/Model/order_model.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Classes/order_card.dart';
import 'package:flutter/material.dart';


class Orders extends StatelessWidget {
 
  final String title;
  final List<OrderModel> orders;
  final void Function(int) cancel;

  const Orders({super.key, required this.title, required this.orders, required this.cancel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: 
          ListView(children: [
            authPadding(textBackButtonAppBar(context, title)),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: orders.length,
                itemBuilder: (context, i) => OrderCard(order: orders[i], cancel: cancel,),),
            ), const SizedBox(height: 20,)
          ],),
      ); 
    }
}
