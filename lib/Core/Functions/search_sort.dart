import 'package:fasty/Data/Model/item_model.dart';
import 'package:fasty/main.dart';

List<ItemModel> globalSearch(String val, List<ItemModel> items){
      String lowerCaseVal = val.toLowerCase();
      items = items.where((item) => item.name!.toLowerCase().contains(lowerCaseVal)).toList();
      return items;
    }

List<ItemModel> globalSort(List<ItemModel> items){
      
      String sorting = sharedPrefs.getString("sorting")!;
      bool highToLow = sharedPrefs.getBool("high to low")!;
      if(sorting == "Popularity"){
        items.sort((a, b) => b.rating!.compareTo(a.rating!));
      }else{
        items.sort((a, b) => DateTime.parse(b.date!).compareTo(DateTime.parse(a.date!)));
      }
      if(!highToLow){
        items= items.reversed.toList();
      }
      return items;
    }