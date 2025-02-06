

import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Constant/apilinks.dart';

class EnterInfoData{
  Crud crud;
  EnterInfoData(this.crud);
  postData(String email, String phonenumber, String password, String firstName, String lastName, String address, String mediaId) async{

    var response = await crud.postRequest(ApiLinks.signupLink, {
    "first_name" : firstName,
    "last_name" : lastName,
    "address" : address,
    "phone_number" : phonenumber,
    "email" : email,
    "password" : password, "media_id" : mediaId
    });

    return response;
  }
}