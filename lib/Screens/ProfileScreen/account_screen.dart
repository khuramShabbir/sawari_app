import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Controllers/app_controller.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(),
            blackText("Ratings"),
            lineContainer(),
            blackText("Notifications, emails, & SMS"),
            blackText("Change password"),
            blackText("Postal address"),
            lineContainer(),
            blackText("Available funds"),
            blackText("Bank details"),
            blackText("Payment & refunds"),
            lineContainer(),
            blackText("Help"),
            blackText("Terms & Conditions"),
            blackText("Data protection"),
            blackText("Licenses"),
            lineContainer(),
            Text(
              "Log out",
              style: AppTextStyle.blacktext14.copyWith(
                  color: AppTextColors.primaryColor,
                  fontWeight: FontWeight.w600),
            ),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }

  Widget blackText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    );
  }

  Widget lineContainer() {
    return Container(
      height: 1.5,
      width: Get.width,
      color: Colors.grey.withOpacity(0.6),
    );
  }
}
