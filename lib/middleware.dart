
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MiddleWare extends GetMiddleware{

 int? get priorety => 1;

 @override
 RouteSettings? redirect(String? route) {

  if(sharedPrefs.getString("sorting") == null){
  sharedPrefs.setBool("high to low", true);
  sharedPrefs.setString("sorting", "Popularity");
  }
  if(false){
    return const RouteSettings(name : AppRoutes.home);
  }
  if(sharedPrefs.getBool("firstTime") != null){
    return const RouteSettings(name : AppRoutes.login);
  }
  return null;
 }
 

} 