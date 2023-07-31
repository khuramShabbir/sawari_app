import 'dart:async';

import 'package:flutter/material.dart';

import '../moiz_bhai_Screens/choose_login_signup.dart';
import '../moiz_bhai_Screens/theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Chooseloginsignup())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Share',
          style: TextStyle(
              fontSize: 45,
              color: AppColors.primeColor,
              fontWeight: FontWeight.w700),
        ),
        Text(
          'Fare.',
          style: TextStyle(
            fontSize: 45,
            color: AppColors.primeColor,
          ),
        )
      ],
    )));
  }
}
