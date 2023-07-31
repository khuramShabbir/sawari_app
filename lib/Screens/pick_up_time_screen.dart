import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Controllers/app_controller.dart';

import '../Utilities/app_bar.dart';
import '../Utilities/forward_arrow.dart';
import 'middle_seat_screen.dart';

class PickUpTimeScreen extends StatelessWidget {
  const PickUpTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const CustomAppBar(),
              Text(
                "At what time will you pick\npassengers up?",
                style: AppTextStyle.headerStyleBlack24
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.dialog(Column(
                    children: [
                      TimePickerDialog(
                        initialTime: TimeOfDay.fromDateTime(DateTime.now()),
                      )
                    ],
                  ));
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
                      const Text(
                        '18:00',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
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
                        Get.to(const MiddleSeatScreen());
                      },
                      child: const ForwardArrow()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
