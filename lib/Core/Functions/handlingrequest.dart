import 'package:fasty/Core/Classes/statuts_request.dart';

StatusRequest handlingData(response){
  if(response is StatusRequest){
    return response;
  }else{
    return StatusRequest.sucsses;
  }
}