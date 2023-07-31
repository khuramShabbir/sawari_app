import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Controllers/app_controller.dart';
import 'package:sawari_app/Screens/pay_ride_screen.dart';
import 'package:sawari_app/Utilities/continue_button.dart';

import '../Utilities/app_bar.dart';

class RideDetailScreen extends StatelessWidget {
  const RideDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: CustomAppBar(),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Get.width * 0.1,
                right: Get.width * 0.1,
                bottom: Get.height * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Mon 01 May",
                  style: AppTextStyle.headerStyleBlack24,
                ),
                Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.07),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(Icons.account_circle),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ahsan Ali",
                      style: AppTextStyle.blacktext12,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellowAccent.shade700,
                          size: 17,
                        ),
                        Text(
                          "4.5/27 Ratings",
                          style: AppTextStyle.blacktext8,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Center(
            child: Container(
              width: Get.width * 0.85,
              height: Get.height * 0.18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200, width: 2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "12:10",
                            style: AppTextStyle.blacktext14
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text("LHR", style: AppTextStyle.blacktext12),
                          const SizedBox(height: 8),
                          Text(
                            "14:20",
                            style: AppTextStyle.blacktext14
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text("RWP", style: AppTextStyle.blacktext12),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: AppTextColors.primaryColor,
                                    width: 2)),
                          ),
                          Container(
                            height: Get.height * 0.08,
                            width: 4,
                            color: AppTextColors.primaryColor,
                          ),
                          Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: AppTextColors.primaryColor,
                                    width: 2)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lahore Gulburg",
                            style: AppTextStyle.blacktext14
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "15 km from your arrival",
                            style: AppTextStyle.greytext12.copyWith(
                                color: AppTextColors.primaryColor,
                                fontFamily: 'Roboto'),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Rawalpindi, Hafzabad",
                            style: AppTextStyle.blacktext14
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "05 km from your departure",
                            style: AppTextStyle.greytext12.copyWith(
                                color: AppTextColors.primaryColor,
                                fontFamily: 'Roboto'),
                          ),
                        ],
                      ),
                      Container()
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Total price for 1 passenger",
                        style: AppTextStyle.blacktext12
                            .copyWith(fontFamily: 'Roboto'),
                      ),
                      Text(
                        "PKR 2,590/-",
                        style: AppTextStyle.blacktext14
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(23),
            margin: const EdgeInsets.all(20),
            width: Get.width * 0.85,
            height: Get.height * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade200, width: 2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 18),
                  child: Text(
                    "Passengers",
                    style: AppTextStyle.blacktext14
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 3.0),
                                    child: Text(
                                      "Arham",
                                      style: AppTextStyle.blacktext12,
                                    ),
                                  ),
                                  Text(
                                    "Township Lahore > Rawalpindi",
                                    style: AppTextStyle.greytext12,
                                  ),
                                ],
                              ),
                              const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.black,
                                  child: Icon(Icons.account_circle))
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Share ride",
                style: AppTextStyle.blacktext14.copyWith(
                    color: AppTextColors.primaryColor,
                    fontWeight: FontWeight.w700),
              ),
              Container(),
              Text(
                "Report ride",
                style: AppTextStyle.blacktext14
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.045,
          ),
          InkWell(
              onTap: () {
                Get.to(const PayRideScreen());
              },
              child: const ContinueButton())
        ],
      ),
    ));
  }
}
