

import 'package:fasty/Controller/account/profile/addresses_controller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/dialogs.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Classes/address_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Addresses extends GetView<AddressesController> {
  const Addresses({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=> AddressesController());
    return Scaffold(
      
      body:
        GetBuilder<AddressesController>( builder: (controller) =>
          ListView(children: [
            authPadding(Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            textBackButtonAppBar(context, "Addresses"),
            const SizedBox(height: 30,),
            const Text("Primary Address", style: TextStyle(color: AppColors.darkMediumGrey, 
            fontWeight: FontWeight.bold, fontSize: 18),),
             AddressCard(isPrimary: true, text: controller.primaryAddress.name!, 
             savePrimaryAddress: null,
             formKey: controller.formKey, editController: controller.editController, saveDeleteAddress: null,
             saveEditAddress: (){controller.saveEditAddress(-1);}),
              ],
            ),),
            const SizedBox(height: 5,),
          
            const Divider(color: AppColors.darkMediumGrey,),
          
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child : Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
            Row(
              children: [
               Text("Other(${controller.otherAddresses.length})", style: 
               const TextStyle(color: AppColors.darkMediumGrey, fontWeight: FontWeight.bold, fontSize: 18),), const Spacer(),
ElevatedButton(style: ButtonStyle(
  overlayColor: WidgetStateProperty.all<Color>(AppColors.softGrey),
   backgroundColor: WidgetStateProperty.all<Color>(AppColors.circleGrey),
   shape: WidgetStateProperty.all<RoundedRectangleBorder>( RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: (){controller.addController.text = "";
                        addAddressDialog("Add", controller.formKey, controller.addController, 
                      () async {await controller.saveAddAddress();});},
                      child: const Row(
                    children: [Text("Add",style: TextStyle(fontWeight: FontWeight.bold,
                          color: AppColors.brownRed,
                          fontSize: 18.5, ),), SizedBox(width: 10,), Icon(FontAwesomeIcons.plus, size: 17.5, 
                          color: AppColors.brownRed,) ],), )
          
            ],),
            ListView.builder(shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
               itemCount: controller.otherAddresses.length,
            itemBuilder: (context, i) =>AddressCard(isPrimary: false, text: controller.otherAddresses[i].name!, 
             formKey: controller.formKey, editController: controller.editController, 
             savePrimaryAddress: (){controller.savePrimaryAddress(i);},
             saveEditAddress: (){controller.saveEditAddress(i);}, saveDeleteAddress: (){controller.saveDeleteAddress(i);})
            ),
             
              ],
            ))
          
            ]),
        )
    );
  }
}