// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Contollers/AuthControllers/app_controller.dart';
import 'package:sawari_app/Screens/Vehicles/show_all_vehicle.dart';
import 'package:sawari_app/Screens/personal_info_screen.dart';

import '../../Contollers/AuthControllers/auth_controller.dart';
import '../Vehicles/add_car_screen.dart';

// ignore: must_be_immutable

class AboutYouScreen extends StatelessWidget {
  AboutYouScreen({Key? key}) : super(key: key);
  AuthProvider authProvider = AuthProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    blackText("Mujeeb"),
                    const Text(
                      "newcumor",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.shade400,
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 42,
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            InkWell(
                onTap: () {
                  Get.to(const PersonalInfoScreen());
                },
                child: purpleText("Edit profile")),
            SizedBox(
              height: Get.height * 0.02,
            ),
            // blackText("Verify your profile"),
            // purpleText("Verify my ID"),
            // purpleText("Confirm google account"),
            // purpleText("Confirm phone number"),
            // blackText("About you"),

            // purpleText("Add a mini bio"),
            purpleText("Add my preferences"),
            SizedBox(
              height: Get.height * 0.02,
            ),
            // blackText("Vehicles"),

            InkWell(
                onTap: () {
                  Get.to(const AddCarScreen());
                },
                child: purpleText("Add Vehicle")),
            SizedBox(
              height: Get.height * 0.02,
            ),
            InkWell(
                onTap: () {
                  Get.to(const ShowAllVehicle());
                },
                child: purpleText("View All Vehicle")),
          ],
        ),
      ),
    );
  }

  Widget purpleText(String text) {
    return Text(
      text,
      style:
          AppTextStyle.blacktext14.copyWith(color: AppTextColors.primaryColor),
    );
  }

  Widget blackText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}
