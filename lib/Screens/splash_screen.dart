import 'dart:async';

import 'package:flutter/material.dart';

import '../Controllers/app_controller.dart';
import '../moiz_bhai_Screens/choose_login_signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const Chooseloginsignup())));
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
              color: AppTextColors.primaryColor,
              fontWeight: FontWeight.w700),
        ),
        Text(
          'Fare.',
          style: TextStyle(
            fontSize: 45,
            color: AppTextColors.primaryColor,
          ),
        )
      ],
    )));
  }
}
