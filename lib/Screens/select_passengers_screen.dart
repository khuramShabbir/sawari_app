import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Contollers/AuthControllers/app_controller.dart';
import 'package:sawari_app/Screens/middle_seat_screen.dart';
import 'package:sawari_app/Utilities/app_bar.dart';

import '../Utilities/forward_arrow.dart';
import '../getX/frame31controller.dart';

class SelectPassengersScreen extends StatelessWidget {
  SelectPassengersScreen({Key? key}) : super(key: key);
  final Frame31Controller controller = Get.put(Frame31Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const CustomAppBar(),
            Padding(
              padding: EdgeInsets.only(
                  top: Get.height * 0.02, bottom: Get.height * 0.03),
              child: Text(
                "Select your car",
                style: AppTextStyle.headerStyleBlack24
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            child: Text("Car Picture"),
                            radius: Get.height * 0.07,
                          ),
                          Text(
                            "Name",
                            style: AppTextStyle.blacktext20,
                          ),
                          Text(
                            "Model",
                            style: AppTextStyle.blacktext20,
                          ),
                          Text(
                            "Model",
                            style: AppTextStyle.blacktext20,
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              height: 0.5,
              color: Colors.grey,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: Get.height * 0.05, bottom: Get.height * 0.05),
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
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: AppTextColors.primaryColor)),
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
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: AppTextColors.primaryColor)),
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                    onTap: () {
                      Get.to(const MiddleSeatScreen());
                    },
                    child: const ForwardArrow()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
