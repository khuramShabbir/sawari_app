import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:place_picker/place_picker.dart';
import 'package:provider/provider.dart';
import 'package:sawari_app/Screens/pick_up_time_screen.dart';
import 'package:sawari_app/Utilities/app_bar.dart';
import 'package:sawari_app/main.dart';
import 'package:sawari_app/providers/publish_provider.dart';

import '../Contollers/AuthControllers/app_controller.dart';
import '../Utilities/forward_arrow.dart';

class DropOfLocationScreen extends StatelessWidget {
  const DropOfLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<BookingController>(builder: (__, auth, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomAppBar(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    "Select Drop Off Location",
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
                  child: TextField(
                    controller: auth.destinationLocationcontroller,
                    onTap: () async {
                      LocationResult? result = await Get.to(
                        () => PlacePicker(
                          "AIzaSyCWny4UpQAR8LeHs1sAIgZYwvlK9udsP8g",
                        ),
                      );
                      auth.getdestinationLocation(
                          result?.formattedAddress ?? "");
                      logger.i(result?.latLng?.latitude ?? 0.0);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '    Tap To select Location',
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                        onTap: () {
                          Get.to(const PickUpTimeScreen());
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
