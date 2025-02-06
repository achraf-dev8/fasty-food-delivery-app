import 'dart:io';

import 'package:fasty/Core/Classes/statuts_request.dart';

 checkInternet() async{
return true;
try{
  var result = await InternetAddress.lookup("google.com");
  if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){return true;
  }else{
    return false;
  }
}on SocketException catch(_){
  return false;
}
 }

 checkInternetFull() async{
  
  return await checkInternet() ?  StatusRequest.sucsses : StatusRequest.offlinefailure;
}