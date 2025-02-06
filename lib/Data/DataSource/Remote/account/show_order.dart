

import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Constant/apilinks.dart';
import 'package:fasty/main.dart';

class ShowOrderData{
  Crud crud;
  ShowOrderData(this.crud);

    showCurrent() async{
  return await crud.postRequest(ApiLinks.showCurrentLink, {
    "user" : sharedPrefs.getInt("id").toString(),
  });
}

  showArchived() async{
    return await crud.postRequest(ApiLinks.showArchivedLink, {
    "user" : sharedPrefs.getInt("id").toString(),
    });
  }

}