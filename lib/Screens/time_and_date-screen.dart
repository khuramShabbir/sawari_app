import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sawari_app/Contollers/AuthControllers/app_controller.dart';
import 'package:sawari_app/Screens/select_passengers_screen.dart';
import 'package:sawari_app/Utilities/show_tost.dart';
import 'package:sawari_app/providers/publish_provider.dart';

import '../Utilities/app_bar.dart';
import '../Utilities/forward_arrow.dart';

class TimeandDateScreen extends StatelessWidget {
  const TimeandDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<BookingController>(builder: (context, child, __) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const CustomAppBar(),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Text(
                  "Select Start Date ",
                  style: AppTextStyle.headerStylePrimaryText24
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                InkWell(
                  onTap: () {
                    child.selectPickUpDate(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 50,
                      ),
                      Text(
                        child.selectedDate == null
                            ? "Select Date"
                            : "${child.selectedDate}".split(" ").first,
                        style: AppTextStyle.headerStyleBlack24,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.2,
                ),
                Text(
                  "At what time will you pick\npassengers up?",
                  style: AppTextStyle.headerStylePrimaryText24
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                InkWell(
                  onTap: () {
                    child.displayTimeDialog(context);
                  },
                  child: Container(
                    width: Get.width * 0.8,
                    height: 60,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50, color: Color(0xFFE5DDEE)),
                        borderRadius: BorderRadius.circular(55),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(),
                        Text(
                          child.selectedTime == null
                              ? "Select time"
                              : "${child.selectedTime}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_down_outlined)
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                        onTap: () {
                          child.selectedTime == null
                              ? showToast("Select Time")
                              : Get.to(SelectPassengersScreen());
                        },
                        child: const ForwardArrow()),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
