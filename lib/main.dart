import 'package:ecommerce/Utils/AppRouteNames.dart';
import 'package:flutter/material.dart';

import 'Ui/Login/loginScreen.dart';
import 'Ui/SplashScreen/Splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Approutenames.SplashScreen,
      routes: {
        Approutenames.SplashScreen: (context) => SplashScreen(),
        Approutenames.loginScreen: (context) => Loginscreen(),
      },
    );
  }
}