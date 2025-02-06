

import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Constant/apilinks.dart';

class ResetPasswordData{
  Crud crud;
  ResetPasswordData(this.crud);
  postData(String login, String logintype) async{

    var response = await crud.postRequest(ApiLinks.verifyloginLink, {
      "login" : login, "logintype" : logintype
    });

    return response;
  }
}