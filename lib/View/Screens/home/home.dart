
import 'package:fasty/Controller/home/home_controller.dart';
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Constant/colors.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/View/Screens/error/handling-request-view.dart';
import 'package:fasty/View/Widgets/Functions/buttons.dart';
import 'package:fasty/View/Widgets/Functions/shapes.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Home extends GetView<Homecontroller> {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(Homecontroller());
    return GetBuilder<Homecontroller>(
      builder: (controller) =>
         Scaffold(
          appBar: controller.statusRequest != StatusRequest.sucsses || controller.selectedIndex == 3 ? null : AppBar(
            
            automaticallyImplyLeading: false,
            surfaceTintColor: Color.fromARGB(0, 250, 249, 246),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
Stack(
  alignment: Alignment.topRight,
  children: [
    greyCircle(
      IconButton(
        icon: const Icon(FontAwesomeIcons.bell, color: AppColors.brownRed, size: 20),
        onPressed: () {controller.toNotifications(); },
      ),
      42, EdgeInsets.zero,
    ),
    if (AllData().notification == 1) 
      Container(
        width: 13,
        height: 13,
        decoration: const BoxDecoration(
          color: AppColors.red,
          shape: BoxShape.circle,
        ),
      ),
  ],
), const SizedBox(width: 10,),
         cartIconButton((){controller.toCart();}), ], ), ], ),
              backgroundColor: AppColors.white,
            ), bottomNavigationBar: controller.statusRequest != StatusRequest.sucsses ? null
            : BottomNavigationBar(
                onTap: (val){controller.changeSelected(val);},
                showSelectedLabels: true,
                currentIndex: controller.selectedIndex,
                selectedItemColor: AppColors.organgeYellow,
                unselectedItemColor: AppColors.mediumGrey,
                selectedLabelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold) ,
                selectedIconTheme: const IconThemeData(size: 19.5),
                unselectedIconTheme: const IconThemeData(size: 19),
                items: const [
                  BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.house), label: "Home"),
                  BottomNavigationBarItem(icon: Icon(FluentIcons.food_16_filled), label: "Menu"),
                  BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.solidHeart), label: "Favorite"),
                   BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.solidUser), label: "Account"),
                ]),
          body: HandlingRequestView(statusRequest: controller.statusRequest, update: ()async{ await controller.getData();}, 
          widget: controller.pagesList[controller.selectedIndex],)  
          ));
      }
  }
