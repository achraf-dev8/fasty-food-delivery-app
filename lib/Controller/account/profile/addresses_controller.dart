
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Functions/add_check_snack_bar.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/account/profile/address.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/Data/Model/address_model.dart';
import 'package:fasty/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressesController extends GetxController{
  AddressData addressData = AddressData(Get.find());
  late AddressModel primaryAddress;
  late List<AddressModel> otherAddresses;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController addController = TextEditingController();
  TextEditingController editController = TextEditingController();
  bool checkState = false;
  @override
  void onInit(){
    primaryAddress = AllData().addresses.firstWhere((address) => address.id == sharedPrefs.getInt("address"));
    otherAddresses = AllData().addresses.where((address) => address.id != sharedPrefs.getInt("address")).toList();
    super.onInit();
  }
  @override
  void dispose(){
        addController.dispose();
    editController.dispose();
    super.dispose();
  }
  saveAddAddress()async{
    if(formKey.currentState!.validate()) {
      var response = await addressData.addAddress(addController.text);
      Get.back();
     StatusRequest statusRequest = handlingData(response);

      if(addCheck(statusRequest)){
      int id= int.parse(response["id"]);  
      AllData().addresses.add(AddressModel(name: addController.text, id :id),);
      defineOtherAddresess();
      }
      update();
    }
  }

    saveEditAddress(int i){
    if(formKey.currentState!.validate()){
     AddressModel address = i!=-1 ? otherAddresses[i] : primaryAddress;
      AllData().addresses.firstWhere((checkddress)=> checkddress.id == address.id).name = editController.text;
      address.name = editController.text;
      addressData.updateAddress(address.id!, editController.text);
      Get.back();
      update();
    }
  }
      saveDeleteAddress(int i){
      int addressId = otherAddresses[i].id!;
      AllData().addresses.removeWhere((address)=> address.id == addressId);
      defineOtherAddresess();
      addressData.deleteAddress(addressId);
      Get.back();
      update();
  }
  savePrimaryAddress(int i) async{
      int addressId = otherAddresses[i].id!;
      sharedPrefs.setInt("address", addressId);
    primaryAddress = AllData().addresses.firstWhere((address) => address.id == addressId);
    otherAddresses = AllData().addresses;
      await addressData.primaryAddress(addressId);
      defineOtherAddresess();
      update();
  }
  
      defineOtherAddresess(){
      otherAddresses = AllData().addresses.where((address) => address.id != sharedPrefs.getInt("address")).toList();
    }
  
  }



