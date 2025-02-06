
import 'package:fasty/Core/Functions/validator.dart';
import 'package:fasty/View/Widgets/Classes/textfeild.dart';
import 'package:fasty/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget gloabalEmailTextField(String label, TextEditingController controller, GetxController parentController){
  return TextFeild(label: label, textController: controller, valid: (val){return validInput(val!, 5, 50, "Email", parentController, "loginExists");},);
}

Widget emailTextField(TextEditingController controller, GetxController parentController){
  return gloabalEmailTextField("Email", controller, parentController);
}

Widget phoneTextFeild(TextEditingController controller, GetxController parentController){
  return TextFeild(label: "Phone number", textController: controller, 
  valid: (val){return validInput(val!, 10, 20, "Phone number", parentController, "loginExists");}, numiric : false);
}


Widget firstNameTextField(TextEditingController controller){
  return TextFeild(label: "First Name", textController: controller, valid: (val){return validInput(val!, 2, 30, "First Name", null, null);},);
}

Widget lastNameTextField(TextEditingController controller){
  return TextFeild(label: "Last Name", textController: controller, valid: (val){return validInput(val!, 2, 30, "Last Name", null, null);},);
}

Widget addressTextField(TextEditingController controller){
  return TextFeild(maxLines: 4, label: "Address", textController: controller, valid: (val){return validInput(val!, 6, 200, "Address", null, null);},);
}

Widget passwordTextFeild(String label, TextEditingController controller, bool shouldValid, bool shouldCheck, bool obscureText, final void Function()? onIconPressed){
  return TextFeild(label: label, obscureText: obscureText, textController: controller, valid: (val){
    return shouldValid ? validInput(val!, 8, 25, "Password", null, null) : val!.isEmpty ? "Enter a password" :
    shouldCheck && val != sharedPrefs.getString("password") ? "Wrong password" :
     null;
}, onIconPressed : onIconPressed);
}

Widget confrimPasswordTextFeild(String label, TextEditingController controller, bool obscureText, final void Function()? onIconPressed, var parentController){
  return TextFeild(label: "Confirm $label", obscureText: obscureText, textController: controller, valid: (val){
    if(val!.isEmpty){  return "Confirm your $label"; } if(parentController.wrongConfirmation){return "The passwords don't match";}
}, onIconPressed : onIconPressed);
}

