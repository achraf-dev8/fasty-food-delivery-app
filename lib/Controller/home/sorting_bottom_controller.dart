


import 'package:fasty/main.dart';
import 'package:get/get.dart';

class SortingBottomSheetController extends GetxController{

    String selected = sharedPrefs.getString("sorting")!;
    bool highToLow = sharedPrefs.getBool("high to low")!;

    define(){
    selected = sharedPrefs.getString("sorting")!;
    highToLow = sharedPrefs.getBool("high to low")!;
    }

    onChange(String name){
      if(name == selected){
              highToLow = !highToLow;
            }else{
              selected = name;
              highToLow = true;
            }
            update();
    }

    apply(){
     sharedPrefs.setString("sorting", selected);
    sharedPrefs.setBool("high to low", highToLow);
    Get.back();
    }

}