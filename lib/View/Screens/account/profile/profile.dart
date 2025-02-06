import 'package:fasty/Controller/account/profile/profile_contoller.dart';
import 'package:fasty/View/Widgets/Functions/appbars.dart';
import 'package:fasty/View/Widgets/Functions/paddings.dart';
import 'package:fasty/View/Widgets/Classes/profile_column.dart';
import 'package:fasty/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Profile extends GetView<ProfileContoller> {

  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileContoller());
    return Scaffold(
      body:SafeArea(
        child: 
          ListView(children: [
            authPadding(textBackButtonAppBar(context, "Profile")),
            const SizedBox(height: 19.5),
            ProfileColumn(name: "Name", body: controller.name, onTap: (){controller.toName();}),
            ProfileColumn(name: "Adress", body: controller.address, onTap: (){controller.toAddresses();}),
            ProfileColumn(name: "Email", body: controller.email, onTap: (){controller.toLogin("email");}),
            ProfileColumn(name: "Phone number", body: controller.phoneNumber, onTap: (){controller.toLogin("phone_number");}),
            const SizedBox(height: 8.5,),
            if(sharedPrefs.getString("password") != "socialMediaPassword")
            ProfileColumn(name: "Change password", onTap: (){controller.toPassword();}),
          ],),
      )
    );}
}