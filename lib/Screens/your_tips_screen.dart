import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Controllers/app_controller.dart';

class YourTipsScreen extends StatelessWidget {
  const YourTipsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.12,
          ),
          Padding(
            padding: EdgeInsets.all(Get.height * 0.052),
            child: Text(
              AppText.yourTipsLargeText,
              style: AppTextStyle.headerStyleBlack24,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: Get.height * 0.052),
            child: Text(
              AppText.yourTipsgreyText,
              style: AppTextStyle.greytext12,
            ),
          ),
        ],
      ),
    ));
  }
}
