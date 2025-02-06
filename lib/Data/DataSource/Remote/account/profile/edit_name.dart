


import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Constant/apilinks.dart';
import 'package:fasty/main.dart';

class EditName{
  Crud crud;
  EditName(this.crud);
  postData(String lastName, String firstName) async{

    var response = await crud.postRequest(ApiLinks.editNameLink, {
    "id" : sharedPrefs.getInt("id").toString(),
    "first_name" : firstName,
    "last_name" : lastName,
    });

    return response;
  }
}