import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/app_controller.dart';

class RoundCornerWhiteTextFormField extends StatelessWidget {
  bool prefix = true;
  RoundCornerWhiteTextFormField({Key? key, required this.prefix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Get.height * 0.083,
        width: Get.width * 0.75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(120),
            border: Border.all(color: AppTextColors.primaryColor, width: 3)),
        child: Padding(
          padding:
              EdgeInsets.only(left: prefix ? Get.width * 0.15 : 10, right: 10),
          child: Center(
            child: TextFormField(
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                  icon: prefix
                      ? const Text("RS",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w700))
                      : const Text(""),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none),
            ),
          ),
        ),
      ),
    );
  }
}
