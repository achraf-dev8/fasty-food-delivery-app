import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Constant/apilinks.dart';
import 'package:fasty/main.dart';

class EditLoginData{
  Crud crud;
  EditLoginData(this.crud);
  postData(String login, String loginType) async{

    var response = await crud.postRequest(ApiLinks.editLoginLink, {
    "id" : sharedPrefs.getInt("id").toString(),
    "login" : login,
    "logintype" : loginType,
    });

    return response;
  }
}
