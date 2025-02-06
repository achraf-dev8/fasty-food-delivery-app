

import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Constant/apilinks.dart';
import 'package:fasty/main.dart';

class AddressData{
  Crud crud;
  AddressData(this.crud);
  deleteAddress(int id) async{
    return await crud.postRequest(ApiLinks.deleteAddressLink, {
    "id" : id.toString(),
    });
  }
  addAddress(String address) async{
  return await crud.postRequest(ApiLinks.addAddressLink, {
  "user" : sharedPrefs.getInt("id").toString(),
  "address" :address,
    });
}

  updateAddress(int id, String address) async{
  return await crud.postRequest(ApiLinks.updateAddressLink, {
  "id" : id.toString(),
  "address" :address,
  });
}
  primaryAddress(int id) async{
  return await crud.postRequest(ApiLinks.primaryAddressLink, {
  "user" : sharedPrefs.getInt("id").toString(),
  "id" :id.toString(),
    });
}

}