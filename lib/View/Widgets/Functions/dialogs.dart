




import 'package:fasty/Controller/home/review_dialog_controller.dart';
import 'package:fasty/Controller/home/select_address_controller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Data/Model/address_model.dart';
import 'package:fasty/Data/Model/review_model.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Functions/text_feilds.dart';
import 'package:fasty/View/Widgets/Classes/address_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

addAddressDialog(String title, GlobalKey<FormState> formKey, TextEditingController controller, void Function() onPressed){
        Get.defaultDialog(title: "$title Address",
        content: SizedBox(
      width: 410,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Form( key: formKey,
            child: addressTextField(controller)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: nextButton(onPressed, "Save"),
        )
      ],),
    )); 
  }

    deleteDialog(String title, void Function()? onPressed){
          Get.defaultDialog(
        backgroundColor: AppColors.white,
      titlePadding: const EdgeInsets.only(right: 13, left : 13, top : 8.5),
      title: title,
      titleStyle: const TextStyle(color: AppColors.black, fontSize: 18.5),
      content:  const Column(children: [Icon(FontAwesomeIcons.trash, color: AppColors.brownRed, size: 28,),]),
      cancel: confirmButton("Yes", onPressed),

      confirm: cancelButton("No"));
  }
  
  reviewDialog(int item, String text, int id, TextEditingController comment, void Function(ReviewModel) add,
   void Function(String, int, int) edit){ 
    Get.lazyPut(() => ReviewController());
      Get.defaultDialog(
      backgroundColor: AppColors.white,
      titlePadding: const EdgeInsets.only(right: 13, left : 13, top : 10),
      title: "$text Review",
      titleStyle: const TextStyle(color: AppColors.black, fontSize: 20,),
      content:  
      GetBuilder<ReviewController>(
        builder: (controller) 
          => Column(
            children: [
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (i) => IconButton( onPressed: (){controller.changeRating(i+1);},
                icon:  Icon(
                          i+1<=controller.rating ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
                               color: AppColors.yellow,
                               size: 22,
                             ),
              ),),),  Form(
                key : controller.formKey,
                child: TextFormField(
                  maxLines: 1, minLines: 1,
                  validator: (val){if(val!.isEmpty){
                    return "Enter a comment";
                  }}, controller: comment,
                  cursorColor: AppColors.black,
                  style: const  TextStyle(fontSize: 20),
                  
                  decoration: const InputDecoration(
                    hintText: 'Comment...',
                    hintStyle:  TextStyle(fontSize: 17.5),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.organgeYellow, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
      cancel: GetBuilder<ReviewController>(
        builder: (controller) 
          => 
          Padding(
            padding: const EdgeInsets.only(right:16.0),
            child: SizedBox(
              width: 110,
        child: OutlinedButton(onPressed: text == "Add" ? ()async {await controller.add(item, comment.text, add);
              } :
              ()async {await controller.edit(id, comment.text, item, edit);}
              , 
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.organgeYellow,
                side: const BorderSide(color: AppColors.organgeYellow, width: 2),
              ), child:  Text(text, 
              style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 18),)),
            ),
          )
      ),

      confirm: cancelButton("Cancel"));
      }


      orderDialog(String text, void Function()? onPressed){
          Get.defaultDialog(
        backgroundColor: AppColors.white,
      titlePadding: const EdgeInsets.only(right: 13, left : 13, top : 10),
      title: text,
      titleStyle: const TextStyle(color: AppColors.black, fontSize: 20,),
      content: const SizedBox(height: 2,),
      cancel: confirmButton("Yes", onPressed),

      confirm: cancelButton("No") );
  }


  Widget confirmButton(String text, void Function()? onPressed){
    return dialogButton(text, onPressed, AppColors.organgeYellow, AppColors.white);
  }


    Widget cancelButton(String text){
    return dialogButton(text, (){Get.back();}, AppColors.white, AppColors.organgeYellow);
  }

  Widget dialogButton(String text, void Function()? onPressed, Color buttonColor, Color textColor){
    return Padding(
        padding: const EdgeInsets.only(left:16.0),
        child: OutlinedButton(onPressed: onPressed, 
        style: OutlinedButton.styleFrom(
          backgroundColor: buttonColor,
          side: const BorderSide(color: AppColors.organgeYellow, width: 2),
        ), child:  Text(text, 
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 16.5),)),
      );
  }

        selectAddress(void Function(AddressModel) onPressed, AddressModel address){
          SelectAddressController controller = SelectAddressController(address);
           Get.lazyPut(() => controller);
          Get.defaultDialog(
        backgroundColor: AppColors.white,
      titlePadding: const EdgeInsets.only(right: 13, left : 13, top : 10),
      title: "Select Address",
      titleStyle: const TextStyle(color: AppColors.black, fontSize: 20,),
      content: SizedBox( height : 440, 
        child: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: GetBuilder<SelectAddressController>(
            builder: (controller) =>
               Column( mainAxisSize: MainAxisSize.min,
                children: List.generate(controller.addresses.length, (i)=>Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: AddressCard(isPrimary: true, text: controller.addresses[i].name!, 
                  active: controller.addresses[i].id == controller.selectedAddress.id,
                  changeSelected: (){controller.changeSelectedAdress(controller.addresses[i]);},
                  ),
                )),
                    ),
          ),
        ),
      ),

      cancel: confirmButton("Confirm", (){onPressed(controller.selectedAddress);}),

      confirm: cancelButton("Cancel") );
  }


  