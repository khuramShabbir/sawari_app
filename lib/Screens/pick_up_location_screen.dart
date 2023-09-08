import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:place_picker/place_picker.dart';
import 'package:provider/provider.dart';
import 'package:sawari_app/Contollers/AuthControllers/app_controller.dart';
import 'package:sawari_app/Screens/drop_of_location.dart';
import 'package:sawari_app/Utilities/forward_arrow.dart';
import 'package:sawari_app/main.dart';

import '../providers/publish_provider.dart';

class PickUpLocation extends StatefulWidget {
  const PickUpLocation({super.key});

  @override
  State<PickUpLocation> createState() => _PickUpLocationState();
}

class _PickUpLocationState extends State<PickUpLocation> {
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    "Select Pick Up Location",
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
                    controller: auth.pickUpLocationcontroller,
                    onTap: () async {
                      LocationResult? result = await Get.to(
                        () => PlacePicker(
                          "AIzaSyCWny4UpQAR8LeHs1sAIgZYwvlK9udsP8g",
                        ),
                      );
                      auth.getPickUpLocation(result?.formattedAddress ?? "");
                      logger.i(result?.latLng?.latitude ?? 0.0);
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '    Tap To select Location',
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                        onTap: () {
                          Get.to(DropOfLocationScreen());
                        },
                        child: ForwardArrow()),
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
