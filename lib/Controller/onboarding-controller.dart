import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/fcmconfig.dart';
import 'package:fasty/Data/DataSource/static.dart';
import 'package:fasty/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{
final int animDration = 400;
late PageController pgController;
int currentPage = 0;
next(){
  if(currentPage != onBoardingList.length-1){
  currentPage++;
pgController.animateToPage(currentPage, duration: Duration(milliseconds: animDration), curve: Curves.easeInOut);
}else{
skip();
}
}

skip(){
  sharedPrefs.setBool("firstTime", false);
Get.offAllNamed(AppRoutes.signup);
}

onPageChanged(int val){
  currentPage=val;
  update();
}

@override
  void onInit() {
    requestNotificationPermisson();
    fcmconfig();
    pgController = PageController();
    super.onInit();
  }

}