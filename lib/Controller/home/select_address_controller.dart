
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/Data/Model/address_model.dart';
import 'package:fasty/main.dart';
import 'package:get/get.dart';

class SelectAddressController extends GetxController{
  SelectAddressController(this.selectedAddress);
  AddressModel selectedAddress;
  List<AddressModel> addresses = [];
  @override
  void onInit(){
    addresses = AllData().addresses;
    AddressModel primaryAddress =  addresses.firstWhere((address) => address.id == sharedPrefs.getInt("address"));
    if(primaryAddress.id != selectedAddress.id){
    addresses.removeWhere((address)=>address.id == sharedPrefs.getInt("address"));
    addresses.insert(0, primaryAddress);
    }
    addresses.removeWhere((address)=>address.id == selectedAddress.id);
    addresses.insert(0, selectedAddress);
    super.onInit();
  }

  changeSelectedAdress(AddressModel address){
    selectedAddress = address;
    update();
  }
}