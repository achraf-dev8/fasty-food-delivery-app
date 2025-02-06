import 'package:fasty/Controller/account/account_controller.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/View/Widgets/Classes/account_row.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';


class Account extends GetView<AccountController> {
  const Account({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AccountController());
    return Scaffold(
      body:SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const SizedBox(height: 30,),
           Padding(
               padding: const EdgeInsets.only(left: 20),
              child: 
                   Text(controller.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21.5),)
        ),
          const SizedBox(height: 18,),
          AccountRow(name :"Profile", icon : FontAwesomeIcons.solidCircleUser, onTap: (){Get.toNamed(AppRoutes.profile);}),
          AccountRow(name: "Current Orders", icon:  FontAwesomeIcons.box,onTap:  (){Get.toNamed(AppRoutes.currentOrders);}),
          AccountRow(name: "Archived Orders", icon:  FontAwesomeIcons.boxOpen,onTap:  (){Get.toNamed(AppRoutes.archivedOrders);}),
          AccountRow(name: "Reviews",icon:  FontAwesomeIcons.solidCommentDots,onTap:  (){Get.toNamed(AppRoutes.reviews);}),
          AccountRow(name:  "FAQ",icon:  FontAwesomeIcons.solidCircleQuestion,onTap: (){Get.toNamed(AppRoutes.questions);}),
          AccountRow(name: "Call Us",icon:  FontAwesomeIcons.phone,onTap:  ()async {await launchUrl(Uri.parse("tel:+21394494949"));}),
          const SizedBox(height: 22,),
          AccountRow(name:  "Log out",icon:  FontAwesomeIcons.rightFromBracket,onTap: (){controller.logOut();}),
          ],
        ),
      )
    );
  }


}