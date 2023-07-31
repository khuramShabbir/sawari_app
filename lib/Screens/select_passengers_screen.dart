import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Controllers/app_controller.dart';
import 'package:sawari_app/Utilities/app_bar.dart';

import '../Utilities/forward_arrow.dart';
import '../getX/frame31controller.dart';
import 'passenger_book_screen.dart';

class SelectPassengersScreen extends StatelessWidget {
  SelectPassengersScreen({Key? key}) : super(key: key);
  final Frame31Controller controller = Get.put(Frame31Controller());

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
                  "So how many ShareFare\nPassengers can you take?",
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
                      Get.to(const PassengerBookScreen());
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
