import 'package:fasty/Core/Classes/crud.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(Crud());
  }
}