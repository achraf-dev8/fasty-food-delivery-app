


import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/main.dart';
import 'package:get/get.dart';

class ProfileContoller extends GetxController{

  String name = "${sharedPrefs.getString("last_name")} ${sharedPrefs.getString("first_name")}";
  String email = sharedPrefs.getString("email")!;
  String phoneNumber = sharedPrefs.getString("phone_number")!;
  String address = AllData().addresses.firstWhere((address)=>address.id == sharedPrefs.getInt("address")!).name!;
  
  void toName(){
    Get.toNamed(AppRoutes.changeName);
  }
    void toLogin(String logintype){
    Get.toNamed(AppRoutes.changeLogin, arguments: {"logintype" : logintype});
  }

    void toPassword(){
    Get.toNamed(AppRoutes.changePassword);
  }

      void toAddresses(){
    Get.toNamed(AppRoutes.addresses);
  }



}