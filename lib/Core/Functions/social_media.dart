import 'package:fasty/Controller/auth/signin_controller.dart';
import 'package:fasty/Core/Classes/statuts_request.dart';
import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/Core/Functions/signInProccess.dart';
import 'package:fasty/Core/Functions/handlingrequest.dart';
import 'package:fasty/Data/DataSource/Remote/auth/login.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fasty/Data/DataSource/Remote/auth/signup.dart';


SignUpData signupdata = SignUpData(Get.find());
LoginData logindata = LoginData(Get.find());
Future signInWithGoogle(SignInController controller) async {
  try{
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  if(googleUser == null){
    return;
  }
  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  String email = userCredential.user?.email ?? '';
  String phone = userCredential.user?.phoneNumber ?? '';
  String id=  userCredential.user?.uid ?? '';

 socialMediaSignin(email, phone, id, controller);
  
  }catch(e){
    //Get.defaultDialog(title: e.toString());
  }
}

Future signInWithFacebook(SignInController controller) async {
  try{
  final LoginResult loginResult = await FacebookAuth.instance.login();

      if(loginResult.accessToken == null){
    return;
  }

  // Create a credential from the access token

  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // Once signed in, return the UserCredential
  final userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

  String email = userCredential.user?.email ?? '';
  String phone = userCredential.user?.phoneNumber ?? '';
  String id=  userCredential.user?.uid ?? '';

  socialMediaSignin(email, phone, id, controller);

  }catch(e){
   // Get.defaultDialog(title: e.toString());
  }

}

Future socialMediaSignin(String email, String phone, String id, SignInController controller)async{

    var response = await signupdata.postData(email, "email");
  controller.statusRequest = handlingData(response);

  if(controller.statusRequest == StatusRequest.sucsses){

        if(response["status"] == "media"){
      
          response = await logindata.postData(id, "media_id", "socialMediaPassword");
          signInProccess(response);
        }else if(response["status"] == "banned"){
         controller.wrongLoginInfo = "This account got banned!";
        }else{
      Map arguments = {"phone_number" : phone, "email" : email, "password" : "socialMediaPassword", "type" : "socialMedia",
      "media_id" : id 
      };
      Get.toNamed(AppRoutes.enterInformation, arguments : arguments);
        }

 }
  controller.update();

}