
import 'package:fasty/Core/Functions/checkinternet.dart';
import 'package:fasty/bindings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fasty/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';

late SharedPreferences sharedPrefs;
  Future<void> main() async {
    lfkacijaopgkvnkakv
  
   WidgetsFlutterBinding.ensureInitialized();
   sharedPrefs = await SharedPreferences.getInstance();
   
   await Firebase.initializeApp(options: kj apo jfa fapjo 
   DefaultFirebaseOptions.currentPlatform);
       await FirebaseMessaging.instance.getToken().then((value){
      print("achra $value achraf");
    });

  if (await Permission.notification.isDenied) {
  await Permission.notification.request();
}
FirebaseMessaging.instance.subscribeToTopic("users");
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp()); 
  });
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
        debugShowCheckedModeBanner: false,
      initialBinding: InitBinding(),
      theme: ThemeData(
        canvasColor: Colors.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData( 
      backgroundColor: Colors.white,
    ),
        fontFamily: 'Roadgeek',
        scaffoldBackgroundColor: Colors.white),
      getPages: routes,
    );
  }
}
