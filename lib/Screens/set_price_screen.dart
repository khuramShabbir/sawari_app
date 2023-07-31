import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/getX/frame23Controller.dart';

import '../Controllers/app_controller.dart';
import '../Utilities/app_bar.dart';
import '../Utilities/forward_arrow.dart';
import 'submitted_screen.dart';

class SetPriceScreen extends StatelessWidget {
  SetPriceScreen({Key? key}) : super(key: key);
  final Frame23Controller controller = Get.put(Frame23Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomAppBar(),
              Padding(
                padding: EdgeInsets.only(
                    left: 10,
                    top: Get.height * 0.02,
                    bottom: Get.height * 0.05),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Set your price per seat",
                    style: AppTextStyle.headerStyleBlack24
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (controller.count2 > 0) controller.decrement();
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
                        '${controller.count2.value}',
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w700),
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
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    height: Get.height * 0.035,
                    width: Get.width * 0.66,
                    decoration: BoxDecoration(
                        color: const Color(0xFFA0D675),
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Recommended price:",
                          style: AppTextStyle.blacktext12,
                        ),
                        Text(
                          "RS3150 - RS3300",
                          style: AppTextStyle.blacktext12
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                "Perfect price for this ride! You’ll get passengers in\nno time.",
                style: AppTextStyle.blacktext14,
              ),
              Expanded(
                child: Container(),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                    onTap: () {
                      Get.to(const SubmittedScreen());
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
