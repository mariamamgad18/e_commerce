import 'dart:async';
import 'dart:ui';

import 'package:ecommerce/Utils/AppImages.dart';
import 'package:ecommerce/Utils/AppRouteNames.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //todo: عشان نظبط الduration :
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Approutenames.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: Color(0xFF004182)),
        //todo: عشان نعمل ال Blur Effect :
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
          child: Container(color: Colors.transparent),
        ),
        //todo: عشان نعمل ال Shadow Effect :
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.429,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white.withOpacity(0.3), Colors.transparent],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.429,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                colors: [Colors.white.withOpacity(0.3), Colors.transparent],
              ),
            ),
          ),
        ),

        Center(
          child: Image.asset(
            Appimages.RouteLogoWithBackGround,
            width: MediaQuery.of(context).size.width * 0.920,
            height: MediaQuery.of(context).size.height * 0.177,
          ),
        ),
      ],
    );
  }
}
