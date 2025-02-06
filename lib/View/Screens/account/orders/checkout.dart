


// ignore_for_file: prefer_const_constructors

import 'package:fasty/Controller/account/orders/checkout_controller.dart';
import 'package:fasty/Controller/home/notification_controller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/View/Screens/error/handling-request-view.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Functions/dialogs.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Functions/shapes.dart';
import 'package:fasty/View/Widgets/Classes/checkout_row.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Checkout extends GetView<CheckoutController> {
    const Checkout({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController()); 
        return Scaffold( 
          body:GetBuilder<CheckoutController>(
      builder: (controller) => HandlingRequestView( statusRequest: controller.statusRequest, update: (){controller.reload;},
        widget: authPadding(
                ListView(children: [ textBackButtonAppBar(context, "Checkout"),
                const SizedBox(height: 25),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Aligns the text at the top
          children: [
            Text(
        "Address",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.5),
            ),
          const  SizedBox(width: 8), // Adds some spacing between the texts
            Flexible(
        child: Text(
          controller.selectedAddress.name!,
          style: TextStyle(fontSize: 20, color: AppColors.darkGrey),
          maxLines: null, // Allows unlimited lines
          overflow: TextOverflow.visible, // Ensures it wraps instead of overflowing
        ),
            ), SizedBox(width: 2),
            greyCircle(IconButton(onPressed: (){controller.editAddress();}, icon: Icon(FontAwesomeIcons.pen, size: 17, color: AppColors.brownRed,),), 38,
            EdgeInsets.zero
            )
          ],
        ), SizedBox(height: 17,),
        CheckoutRow(title: "Food Price", body: "${controller.price}\$", icon: FontAwesomeIcons.bagShopping,),
        CheckoutRow(title: "Shipping Price", body: "${controller.shippingPrice}\$", icon: FontAwesomeIcons.truckFast,),
        CheckoutRow(title: "Total", body: "${controller.totalPrice()}\$", icon: FontAwesomeIcons.dollarSign,),
        CheckoutRow(title: "Shipping Time", body: controller.shippingTime, icon: FontAwesomeIcons.solidClock,),
        SizedBox(height: 3,),
        Align( alignment: Alignment.center,
          child: Text(
            "Payement Methode",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.5),
          ), 
        ), SizedBox(height: 6,),  Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
          payementMethodButton(FontAwesomeIcons.sackDollar, "Cash", 
          (){controller.changePayementMethod(0);}, controller.payementMethode == 0),
          SizedBox(width: 20,),
          payementMethodButton(FontAwesomeIcons.paypal, "Paypal", 
          (){controller.changePayementMethod(1);}, controller.payementMethode == 1),
        ],), 
              SizedBox(height:27,),
              Container(margin: EdgeInsets.symmetric(horizontal: 25),
                child: globalNextButton(controller.payementMethode != -1 ? 
                (){controller.checkout(context);} : null, "Checkout(${controller.totalPrice()}\$)", 150, 55, controller.payementMethode != -1))
        
                            ],), 
                           
                            ),
      ),
        )
  );}


}