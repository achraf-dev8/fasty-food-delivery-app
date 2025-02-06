


import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/View/Widgets/Functions/dialogs.dart';
import 'package:fasty/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountController extends GetxController{
  String name = "${sharedPrefs.getString("last_name")} ${sharedPrefs.getString("first_name")}";

  logOut()async{
    orderDialog("Are you sure you want to log out?", (){confirmLogin();});
    }

    confirmLogin()async{
  FirebaseMessaging.instance.unsubscribeFromTopic("user${sharedPrefs.getInt("id")}");
  sharedPrefs.setInt("id", -1);
  if(sharedPrefs.getString("password") == "socialMediaPassword"){
  GoogleSignIn().disconnect();
  await FirebaseAuth.instance.signOut();
  await FacebookAuth.instance.logOut();
    }
    Get.offAllNamed(AppRoutes.login);
    }
  }



