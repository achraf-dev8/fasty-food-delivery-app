

import 'package:fasty/Data/DataSource/Remote/home/all_data.dart';

  globalChangeFavorite(int item) {
  if(checkFavorite(item)){
    AllData().favorite.remove(item); 
    
  }else{
    AllData().favorite.add(item); 
  }
  
  }

bool checkFavorite(int item){
    return AllData().favorite.contains(item);
}