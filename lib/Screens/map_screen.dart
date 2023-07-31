import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Screens/drop_of_location.dart';
import 'package:sawari_app/Utilities/app_bar.dart';
import 'package:sawari_app/Utilities/forward_arrow.dart';

import '../Controllers/app_controller.dart';

class MapScreens extends StatelessWidget {
  const MapScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                "Where would you like to\npick up passengers?",
                style: AppTextStyle.headerStyleBlack24
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              height: 44,
              width: Get.width * 0.6,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFE5DDEE)),
                  borderRadius: BorderRadius.circular(55),
                ),
              ),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.black,
                      child: Text(
                        "?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Text(
                    "Why is an exact location better?",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, right: 20),
              child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                // Add margin to position the input field at the top
                decoration: BoxDecoration(
                  color: const Color(0xffE5DDEE),
                  borderRadius:
                      BorderRadius.circular(30), // Set the border radius here
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Jail Road",
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ), // Adjust horizontal padding
                    border: InputBorder.none, // Remove the border color
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                    onTap: () {
                      Get.to(const DropOfLocationScreen());
                    },
                    child: const ForwardArrow())),
          ],
        ),
      ),
    ));
  }
}
