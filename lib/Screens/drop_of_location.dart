import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Utilities/app_bar.dart';

import '../Controllers/app_controller.dart';
import '../Utilities/forward_arrow.dart';
import 'calender_screen.dart';

class DropOfLocationScreen extends StatelessWidget {
  const DropOfLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "Drop Off",
                  style: AppTextStyle.headerStyleBlack24
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                // Add margin to position the input field at the top
                decoration: BoxDecoration(
                  color: const Color(0xffE5DDEE),
                  borderRadius:
                      BorderRadius.circular(30), // Set the border radius here
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter the full address",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.gps_fixed,
                    ),
                  ),
                  const Text(
                    'Use current location',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 100), // Adjust spacing between text and icon
                    child: Icon(
                      Icons.navigate_next,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                      onTap: () {
                        Get.to(const CalenderScreen());
                      },
                      child: const ForwardArrow())),
            ],
          ),
        ),
      ),
    );
  }
}
