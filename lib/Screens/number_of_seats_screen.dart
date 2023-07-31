import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Screens/pick_up_location_screen.dart';

import '../Controllers/app_controller.dart';
import '../Utilities/app_bar.dart';
import '../Utilities/forward_arrow.dart';
import '../getX/number_of_screens_Controller.dart';

class NumberOfScreens extends StatelessWidget {
  NumberOfScreens({super.key});
  final NumberOfScreensController controller =
      Get.put((NumberOfScreensController()));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const CustomAppBar(),
              Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.02, bottom: Get.height * 0.08),
                child: Text(
                  "Number of seats to book",
                  style: AppTextStyle.headerStyleBlack24
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (controller.count > 0) controller.decrement();
                      },
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border:
                                Border.all(color: AppTextColors.primaryColor)),
                        child: const Center(child: Text("-")),
                      ),
                    ),
                    Obx(
                      () => Text(
                        '${controller.count.value}',
                        style: const TextStyle(fontSize: 50),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.increment();
                      },
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border:
                                Border.all(color: AppTextColors.primaryColor)),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: AppTextColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                    onTap: () {
                      Get.to(const PickUpLocation());
                    },
                    child: const ForwardArrow()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
