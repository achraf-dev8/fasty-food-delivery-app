

import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Constant/apilinks.dart';
import 'package:fasty/main.dart';

class FavoriteData{
  Crud crud;
  FavoriteData(this.crud);
  postData(int item, String state) async{

    var response = await crud.postRequest(ApiLinks.changeFavoriteLink, {
    "item" : item.toString(),
    "user" : sharedPrefs.getInt("id").toString(),
    "state" : state,
    });

    return response;
  }
}