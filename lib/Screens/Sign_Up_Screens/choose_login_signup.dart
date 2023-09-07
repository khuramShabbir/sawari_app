import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Contollers/AuthControllers/app_controller.dart';
import '../../Contollers/AuthControllers/auth_controller.dart';

class Chooseloginsignup extends StatelessWidget {
  Chooseloginsignup({super.key});
  AuthProvider authProvider = AuthProvider();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              image: const AssetImage("assets/images/choose_login.jpeg"),
              height: Get.height * 0.34),
          SizedBox(height: Get.height * 0.05),
          Text('Your pick of rides at',
              style: AppTextStyle.headerStyleBlack24.copyWith(
                fontWeight: FontWeight.w700,
              )),
          Text(
            'low prices.',
            style: AppTextStyle.headerStylePrimaryText24
                .copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: Get.height * 0.08),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border:
                    Border.all(color: AppTextColors.primaryColor, width: 3)),
            child: InkWell(
              onTap: () {
                authProvider.googleLogin();
                // authProvider.googleSignIn();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      // Adjust the padding as needed
                      child: Image.asset(
                        "assets/images/google.png",
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Sign in with google',
                    style: AppTextStyle.blacktext20
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
        ],
      ))),
    );
  }
}
