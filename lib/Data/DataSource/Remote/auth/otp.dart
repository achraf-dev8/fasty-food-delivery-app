

import 'package:fasty/Core/Classes/crud.dart';
import 'package:fasty/Core/Constant/apilinks.dart';

class OtpData{

  Crud crud;
  OtpData(this.crud);
  sendPhone(String phone, int otp) async{
    var response = await crud.postRequest(ApiLinks.sendPhoneLink, {
      "phone" : phone, "otp" : otp.toString()
    });

    return response;
  }
  
    sendEmail(String email, int otp) async{
    var response = await crud.postRequest(ApiLinks.sendEmailLink, {
      "email" : email, "otp" : otp.toString()
    });

    return response;
  }
}
