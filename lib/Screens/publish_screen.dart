import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sawari_app/Contollers/AuthControllers/app_controller.dart';
import 'package:sawari_app/providers/publish_provider.dart';

import '../Utilities/continue_button.dart';
import 'PaymentScreen/final_request_submitted.dart';

class PublishScreen extends StatefulWidget {
  PublishScreen({super.key});

  @override
  State<PublishScreen> createState() => _PublishScreenState();
}

class _PublishScreenState extends State<PublishScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BookingController>(builder: (context, child, __) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Share',
                                    style: TextStyle(
                                      fontSize: 45,
                                      color: AppTextColors.primaryColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Fare.',
                                    style: TextStyle(
                                      fontSize: 45,
                                      color: AppTextColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Pick Up Location',
                          style: AppTextStyle.blacktext18
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(child.pickUpLocationcontroller.text.toString() ??
                            "Select Again"),
                        SizedBox(height: Get.height * 0.035),
                        Text('Destination',
                            style: AppTextStyle.blacktext18.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 8),
                        Text(child.destinationLocationcontroller.text
                                .toString() ??
                            "Select Again"),
                        SizedBox(height: Get.height * 0.034),
                        Text('MeetUp Location',
                            style: AppTextStyle.blacktext18.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 8),
                        Text(child.meetUpLocationcontroller.text.toString() ??
                            "Select Again"),
                        SizedBox(height: Get.height * 0.034),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.calendar_today),
                                const SizedBox(width: 5),
                                Text(child.selectedDate
                                        .toString()
                                        .split(" ")
                                        .first ??
                                    ""),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.access_time_rounded),
                                const SizedBox(width: 5),
                                Text(child.selectedTime.toString() ?? ""),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.034),
                        Row(
                          children: [
                            const Icon(Icons.person),
                            Text(child.numberOfPassengers.toString() ?? "")
                          ],
                        ),
                        SizedBox(height: Get.height * 0.034),
                        const Text("selected car"),
                        SizedBox(
                          height: Get.height * 0.1,
                        ),
                        InkWell(
                            onTap: () {
                              Get.to(const FinalRequestSubmitScreen());
                            },
                            child: const ContinueButton()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
