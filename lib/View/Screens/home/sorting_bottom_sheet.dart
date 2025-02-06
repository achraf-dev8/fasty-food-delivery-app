

import 'package:fasty/Controller/home/sorting_bottom_controller.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SortingBottomSheet extends GetView<SortingBottomSheetController> {
  
  final void Function() onPressed;
  const SortingBottomSheet({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SortingBottomSheetController());
    return  Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(),
            Container(
              height: 4.25,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 165),
              decoration: BoxDecoration(
                color: AppColors.softGrey,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
             Padding(
              padding:  const EdgeInsets.only(left: 22, right: 22, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 13),
                    child:  Text(
                      'Sort by',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  itemRow("Popularity"),
                  itemRow("Newness"),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 45,
                    width: 300,
                    child: OutlinedButton(
                      onPressed: (){controller.apply(); onPressed();}, 
                            style: OutlinedButton.styleFrom(
                              backgroundColor: AppColors.organgeYellow,
                              side: const BorderSide(color: AppColors.organgeYellow, width: 2),
                            ), child: const Text("Apply", 
                            style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 20),)),
                  ),
                ),
                ],
              ),
            ),
          ],
        ),
      );
  }

  Widget itemRow(String name) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.transparent, // Transparent to see the ripple effect
        child: InkWell(
          overlayColor: WidgetStateProperty.all<Color>(AppColors.itemClickGrey),
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            controller.onChange(name);
          },
          highlightColor: Colors.transparent, // Ensures the ripple effect is visible
          splashColor: Colors.grey.withOpacity(0.3), // Customize splash color
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
            child: GetBuilder<SortingBottomSheetController>(
              builder: (controller) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                     name,
                      style: TextStyle(color: !(controller.selected == name)
                       ?AppColors.black : AppColors.organgeYellow, fontSize: !(controller.selected == name) ? 
                       19.75 : 20.5 ),
                    ),
                    Spacer(),
                    Visibility( visible: controller.selected == name,
                      child: Icon(
                        controller.highToLow ? FontAwesomeIcons.arrowDown : FontAwesomeIcons.arrowUp,
                        color: AppColors.organgeYellow,
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
