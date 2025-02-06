import 'package:fasty/Core/Functions/add_to_cart.dart';
import 'package:fasty/Data/Model/item_model.dart';

double getPrices(ItemModel item, String priceMark){

  if(priceMark == "price"){
    return getMainItemSize(item).price!;
  }else{
    return getMainItemSize(item).oldPrice!;
  }
}