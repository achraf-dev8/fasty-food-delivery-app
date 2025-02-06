

import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Constant/apilinks.dart';

class ResetPasswordTwo{
  Crud crud;
  ResetPasswordTwo(this.crud);
  postData(String newPassword, int id) async{

    var response = await crud.postRequest(ApiLinks.resetPasswordLink, {
      "new_password" : newPassword, "id" : id.toString()
    });

    return response;
  }
}