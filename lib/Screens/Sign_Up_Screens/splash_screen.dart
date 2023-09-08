import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sawari_app/Screens/Sign_Up_Screens/sign_up_screen.dart';

import '../../Contollers/AuthControllers/app_controller.dart';

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
            builder: (BuildContext context) => SignUpScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
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
        ),
      ],
    ));
  }
}
