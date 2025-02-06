

import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/View/Widgets/Functions/dialogs.dart';
import 'package:fasty/View/Widgets/Functions/shapes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddressCard extends StatelessWidget {
  final bool isPrimary;
  final String text;
  final GlobalKey<FormState>? formKey;
  final void Function()? saveEditAddress;
  final TextEditingController? editController;
  final void Function()? saveDeleteAddress;
  final void Function()? savePrimaryAddress;
  final void Function()? changeSelected;
  final bool? active;
  const AddressCard({super.key, required this.isPrimary, required this.text,  this.formKey, 
   this.saveEditAddress,  this.editController, this.savePrimaryAddress, this.saveDeleteAddress, this.active, this.changeSelected
  });
  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3.5,
        child: InkWell(
          overlayColor: WidgetStateProperty.all<Color>(AppColors.buttonSplash),
          borderRadius: BorderRadius.circular(10),
          onTap:      editController != null ?
          () {
            editController!.text = text;
            addAddressDialog("Edit", formKey!, editController!, saveEditAddress!);
          } : active != true ? changeSelected :null,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(12),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 SizedBox(
                   child: 
                     Text(
                      
                      text,
                      textAlign: TextAlign.start,
                                     style: TextStyle(fontSize: 19.5),
                     
                                     ), 

                 ), Align(alignment: Alignment.bottomRight,
                   child:
                     Visibility(visible: active==true,
                      child: selectingCircle(null, true)),
                   
                 ), 

                 Visibility(
                  visible: !isPrimary,
                  child: Column(
                    children: [
                      const SizedBox(height: 5,),
                      Row(
                    children: [const SizedBox(), const Spacer(),
                      OutlinedButton(
                  onPressed: savePrimaryAddress,
                  style: OutlinedButton.styleFrom(
                    overlayColor: AppColors.softGrey,
                    backgroundColor: AppColors.circleGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(color: AppColors.circleGrey),
                  ), 
                  child: const Text(
                    "Set as primary",
                    style: TextStyle(fontWeight: FontWeight.bold,
                      color: AppColors.brownRed,
                      fontSize: 16.5,
                    ),
                  ), 
                                ), const Spacer(), greyCircle(
                  IconButton(onPressed:(){ deleteDialog("Are you sure you want to remove this address?", saveDeleteAddress);},
                    icon: const Icon(FontAwesomeIcons.trash, size: 18, color: AppColors.brownRed,)), 40, null
                                ), const SizedBox(), const Spacer(),],
                  )
                    ],
                  ),
                ) ,
              ],
            )
          )
        ),
        
      );
  }



}