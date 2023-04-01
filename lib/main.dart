import 'package:flutter/material.dart';
import 'package:food_ordering/firebase-work/firebase-work.dart';
import 'package:food_ordering/layout-screen.dart';
import 'package:food_ordering/screen/auth-check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_ordering/webAdmin/add-product.dart';
import 'package:food_ordering/webAdmin/update-complete-process.dart';
import 'package:food_ordering/webAdmin/update-product.dart';
import 'package:food_ordering/webAdmin/web-body.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyAe7NOZl6MSCIjIuNRO8jJuExwjtPhk9Ts",
    authDomain: "resturant-app-32a23.firebaseapp.com",
    projectId: "resturant-app-32a23",
    storageBucket: "resturant-app-32a23.appspot.com",
    messagingSenderId: "480665521426",
    appId: "1:480665521426:web:a3334918443ad69e9eb7cb",
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: LayoutScreen(),
    );
  }
}
