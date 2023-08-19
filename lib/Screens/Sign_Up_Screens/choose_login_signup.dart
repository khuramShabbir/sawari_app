import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/app_controller.dart';
import 'login_screen.dart';

class Chooseloginsignup extends StatelessWidget {
  const Chooseloginsignup({super.key});

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
          SizedBox(height: Get.height * 0.05),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTextColors.primaryColor,
              foregroundColor: AppTextColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(55),
              ),
              minimumSize: Size(Get.width * 0.8, 50),
            ),
            child: Text('Sign Up',
                style: AppTextStyle.blacktext20.copyWith(
                    fontWeight: FontWeight.w700, color: Colors.white)),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const Login();
              }));
            },
            child: Text('Login',
                style: AppTextStyle.blacktext20.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppTextColors.primaryColor)),
          ),
        ],
      ))),
    );
  }
}
