import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Controllers/app_controller.dart';
import 'package:sawari_app/Screens/mainScreen.dart';

import '../Utilities/forward_arrow.dart';

class FinalRequestSubmitScreen extends StatelessWidget {
  const FinalRequestSubmitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 14,
                    top: Get.height * 0.1,
                  ),
                  child: Text(
                    "Your request is submitted\nsuccessfully",
                    style: AppTextStyle.headerStyleBlack24
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    "We will notify you once rider confirm\nyour seat.",
                    style:
                        AppTextStyle.blacktext14.copyWith(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.07,
                ),
                Center(child: Image.asset("assets/images/checked 1.png")),
                Expanded(child: Container()),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                      onTap: () {
                        Get.to(MainScreen());
                      },
                      child: const ForwardArrow()),
                )
              ],
            ),
          )),
    );
  }
}
