

import 'package:fasty/Core/Constant/images.dart';
import 'package:fasty/View/Screens/auth/otpverification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PhoneVerification extends StatelessWidget {
  const PhoneVerification({super.key});
  @override
  Widget build(BuildContext context) {
    return OtpVerification(title: "Phone OTP", image: AppImages.phoneVerificationImage, fontSize: 22,);
  }

}
