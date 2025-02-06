

import 'package:fasty/Core/Constant/images.dart';
import 'package:fasty/View/Screens/auth/otpverification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});
  @override
  Widget build(BuildContext context) {
    return OtpVerification(title: "Email OTP", image: AppImages.emailVerificationImage, 
   fontSize : 18,);
  }

}
