import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Screens/search_screen.dart';
import 'package:sawari_app/Utilities/forward_arrow.dart';

import '../Controllers/app_controller.dart';

class SubmittedScreen extends StatelessWidget {
  const SubmittedScreen({Key? key}) : super(key: key);

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
                    "Wait for peoples to submit response. ",
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
                        Get.to(SearchScreen());
                      },
                      child: const ForwardArrow()),
                )
              ],
            ),
          )),
    );
  }
}
