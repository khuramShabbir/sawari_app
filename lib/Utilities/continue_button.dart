import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/app_controller.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: Get.height * 0.042,
          width: Get.width * 0.38,
          decoration: BoxDecoration(
              color: AppTextColors.primaryColor,
              borderRadius: BorderRadius.circular(100)),
          child: const Center(
            child: Text(
              "Continue",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )),
    );
  }
}
