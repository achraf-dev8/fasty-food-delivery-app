


import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/fcmconfig.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/Data/DataSource/Remote/home/cart.dart';
import 'package:fasty/Data/DataSource/Remote/home/home.dart';
import 'package:fasty/View/Screens/account/account.dart';
import 'package:fasty/View/Screens/home/favorite.dart';
import 'package:fasty/View/Screens/home/home_page.dart';
import 'package:fasty/View/Screens/home/menu.dart';
import 'package:fasty/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController{
  
  HomeData homeData = HomeData(Get.find());
  CartData cartData = CartData(Get.find());
  int selectedIndex =0;
  StatusRequest statusRequest = StatusRequest.loading;
  List<Widget> pagesList = [HomePage(toCategory: (val){})]; 


  @override
  void onReady() async{
   pagesList = [  HomePage(toCategory: (val){toCategory(val);}), const Menu(), const Favorite(), const Account()];
    await getData();
    super.onReady();
  }

   getData() async{
  FirebaseMessaging.instance.subscribeToTopic("user${sharedPrefs.getInt("id")}");
  requestNotificationPermisson();
  fcmconfig();
    statusRequest = await homeData.getAllData();
     update();
  }

  changeSelected(int val){
    selectedIndex = val;
    update();
  }

  toCategory(int category){
      pagesList[1] = Menu(category: category,);
      selectedIndex = 1;
      update();
  }

  toNotifications(){
    if(AllData().notification == 1){
    AllData().notification = 0;
    update(); 
    }
    Get.toNamed(AppRoutes.notifications);
  }

    toCart(){
    if(AllData().cartBool == 1){
    cartData.noCart();
    update(); 
    }
    Get.toNamed(AppRoutes.cart);
  }

} 