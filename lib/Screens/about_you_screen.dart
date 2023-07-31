import 'package:flutter/material.dart';
import 'package:sawari_app/Controllers/app_controller.dart';

class AboutYouScreen extends StatelessWidget {
  const AboutYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      style: TextStyle(fontSize: 8, color: Colors.grey),
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
            purpleText("Edit profile picture"),
            purpleText("Edit personal details"),
            blackText("Verify your profile"),
            purpleText("Verify my ID"),
            purpleText("Confirm google account"),
            purpleText("Confirm phone number"),
            blackText("About you"),
            purpleText("Add a mini bio"),
            purpleText("Add my preferences"),
            blackText("Vehicles"),
            purpleText("Add Vehicle"),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }

  Widget purpleText(String text) {
    return Text(
      text,
      style:
          AppTextStyle.blacktext12.copyWith(color: AppTextColors.primaryColor),
    );
  }

  Widget blackText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}
