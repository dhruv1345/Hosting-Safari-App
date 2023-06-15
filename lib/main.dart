import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:finalapp/homepage.dart';
//import 'package:splashscreen/splashscreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
      ),
      // home: const homePage(),
      home: homePage(),
      // SplashScreen(
      //     seconds: 7,
      //     navigateAfterSeconds: homePage(),
      //     title: new Text(
      //       'Hosting Safari',
      //       style: new TextStyle(
      //           fontWeight: FontWeight.bold,
      //           fontSize: 32.0,
      //           color: Colors.teal),
      //     ),
      //     image: Image.asset('animations/splash.jpg', width: 600, height: 600),
      //     photoSize: 100.0,
      //     backgroundColor: Colors.white,
      //     // styleTextUnderTheLoader: new TextStyle(),
      //     loaderColor: Colors.teal),
    );
  }
}
