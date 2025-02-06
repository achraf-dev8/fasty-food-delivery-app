

import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Constant/apilinks.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginData{
  Crud crud;
  LoginData(this.crud);
  postData(String login, String logintype, String password) async{
    var response = await crud.postRequest(ApiLinks.logInLink, {
      "login" : login, "logintype" : logintype, "password":password
    });

    return response;
  }
  
}
