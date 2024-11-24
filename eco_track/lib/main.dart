import 'package:eco_track/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static Map<String, dynamic> profileDetialsMap = {};
  static Map<String, dynamic> deliveryPartnerProfileDetailsMap = {};

  static String userEmail = '';
  static String userType = '';
  static String userName = '';
  static String userPassword = '';

  static String deliveryPartnerEmail = '';
  static String deliveryPartnerUserName = '';
  static String deliveryPartnerPassword = '';

  static double width = 0;
  static double heigth = 0;

  static widthCal(double width) {
    double ans = width / MainApp.width;
    return ans * MainApp.width;
  }

  static heightCal(double height) {
    double ans = height / MainApp.heigth;
    return ans * MainApp.heigth;
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    heigth = MediaQuery.of(context).size.height;
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
