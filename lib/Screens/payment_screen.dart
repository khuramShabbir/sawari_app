import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sawari_app/Controllers/app_controller.dart';

import '../Utilities/forward_arrow.dart';
import 'phone_no.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "Please select your\npayment option.",
                style: AppTextStyle.headerStyleBlack24
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                shadowIcon("assets/images/e.png"),
                shadowIcon("assets/images/jazzcash.png"),
                shadowIcon("assets/images/visa.png"),
              ],
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                    onTap: () {
                      Get.to(PhoneNumberScreen());
                    },
                    child: const ForwardArrow()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shadowIcon(String imagepath) {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(imagepath),
      ),
    );
  }
}
