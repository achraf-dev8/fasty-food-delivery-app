
import 'package:fasty/Core/Constant/routes_names.dart';

import 'package:fasty/main.dart';
import 'package:get/get.dart';

signInProccess(response) async{
         var data = response["data"];
         sharedPrefs.setInt("id", data["id"]);
         sharedPrefs.setString("email", data["email"]);
         sharedPrefs.setString("phone_number", data["phone_number"]);
         sharedPrefs.setString("password", data["password"]);
         sharedPrefs.setString("first_name", data["first_name"]);
         sharedPrefs.setString("last_name", data["last_name"]);
         sharedPrefs.setInt("address", data["address"]);
         await Get.offAllNamed(AppRoutes.home);
         
}