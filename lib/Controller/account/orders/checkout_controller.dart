import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Constant/informations.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';
import 'package:fasty/Data/DataSource/Remote/home/checkout.dart';
import 'package:fasty/Data/Model/address_model.dart';
import 'package:fasty/Data/Model/cart_model.dart';
import 'package:fasty/Data/Model/item_model.dart';
import 'package:fasty/Data/Model/item_size_model.dart';
import 'package:fasty/Data/Model/size_model.dart';
import 'package:fasty/View/Widgets/Functions/dialogs.dart';
import 'package:fasty/main.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController{
  CheckoutData checkoutData = CheckoutData(Get.find());
int payementMethode = -1;
late AddressModel selectedAddress;
double price = 0;
double shippingPrice = AppInformations.shippingPrice;
String shippingTime = AppInformations.shippingTime;
late List<CartModel> cart;
late List<ItemSizeModel> itemSizes;
late List<ItemModel> items;
List<SizeModel?> sizes = [];
StatusRequest statusRequest = StatusRequest.sucsses;

  @override
  void onInit(){
    selectedAddress = AllData().addresses.firstWhere((address) => address.id == sharedPrefs.getInt("address"));
    super.onInit();
  }

  @override
  void onReady(){
    price = Get.arguments["price"];
    cart = Get.arguments["cart"];
    itemSizes = cart.map((cart)=>AllData().itemSizes.firstWhere((itemS)=>cart.itemSize == itemS.id)).toList();
    items = itemSizes.map((itemS)=>AllData().items.firstWhere((item)=>itemS.item == item.id)).toList();

    for(int i =0; i<itemSizes.length ;i++){
      if(itemSizes[i].main != 0){
        sizes.add(AllData().sizes.firstWhere((size)=>size.id == itemSizes[i].size));
      }else{
        sizes.add(null);
      }
    }

    update();

    super.onReady();
  }

changePayementMethod(int i){
  if(i != payementMethode){
   payementMethode= i;
    update();
  }

}

editAddress(){
  selectAddress((AddressModel address){Get.back();
    selectedAddress = address; update();}, selectedAddress);
}

double totalPrice(){
double total = price + shippingPrice;

  
  // Convert to string and split at the decimal point
  String valueString = total.toString();
  int decimalIndex = valueString.indexOf('.');
  
  // Get the substring of the first two digits after the decimal
  String firstTwoDigits = decimalIndex != -1 && decimalIndex + 2 < valueString.length
      ? valueString.substring(decimalIndex + 1, decimalIndex + 3)
      : '00'; // Default to '00' if there aren't two digits
  
  // Convert the substring back to double
  total = double.parse('${valueString.substring(0, decimalIndex + 1)}$firstTwoDigits'); 
return total;
}

List<Map<String, String>> getItemsList(){
  List<Map<String, String>> itemsList = [];

  for(int i=0; i<cart.length; i++){
    Map<String, String> map = <String, String>{};
    map["name"] = sizes[i] != null ? "${items[i].name}(${sizes[i]!.name})" : items[i].name!;
    map["quantity"] = cart[i].amount.toString();
    map["price"] = (itemSizes[i].price! * cart[i].amount!).toString();
    map["currency"] = "USD";
    itemsList.add(map);
  }

  return itemsList;
}

checkout(context)async{
  if(payementMethode == 1){
    List<Map<String, String>> itemsList = getItemsList();
    Get.to(()=> PaypalCheckout(
                sandboxMode: true,
                clientId: AppInformations.clientId,
                secretKey: AppInformations.secretKey,
                returnURL: "success.snippetcoder.com",
                cancelURL: "cancel.snippetcoder.com",
                transactions:  [
                  {
                    "amount": {
                      "total": '${totalPrice()}',
                      "currency": "USD",
                      "details":  {
                        "subtotal": '${price}',
                        "shipping": '$shippingPrice',
                        "shipping_discount": 0
                      }
                    },
                    "description": "",
                    "item_list":  {
                      "items": itemsList,
                    }
                  }
                ],
                note: "Contact us for any questions on your order",
                onSuccess: (Map params) async {
                  Get.back();
                  await confirmCheckoute();
                },
                onError: (error) {
                  Get.back();
                  Get.showSnackbar(GetSnackBar(message: error.toString(), duration: const Duration(milliseconds: 1500),));          
                },
                 onCancel: () {
                  Get.back();         
                },
                
              ),);
  }else{
    await confirmCheckoute();
  }
}

confirmCheckoute() async{
  statusRequest = StatusRequest.loading;
  update();
  List<int> cartIds = cart.map((c)=>c.id!).toList();
  List<String> sizes = this.sizes.map((s)=>s != null ? s.name!: "").toList();
  List<double> prices = itemSizes.map((itemS)=>itemS.price!).toList();
  List<String> images = items.map((item)=>item.image!).toList();
  List<String> names = items.map((item)=>item.name!).toList();

  var response = await checkoutData.postData(selectedAddress.name!, price, 
  shippingPrice, shippingTime, payementMethode == 0 ? "Cash" : "Paypal", cartIds, sizes, prices, images, names);
  statusRequest = handlingData(response);

  if(statusRequest == StatusRequest.sucsses){
    AllData().cart.removeWhere((c)=>cartIds.contains(c.id));
   Get.offAllNamed(AppRoutes.home);
   Get.snackbar("Sucsses", "Your order is pending approval", duration: const Duration(milliseconds: 2800));
  }else{
    update();
  }
}

reload(){
  statusRequest = StatusRequest.sucsses;
  update();
}


}