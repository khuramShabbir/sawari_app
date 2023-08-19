import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sawari_app/Controllers/app_controller.dart';

class EmptyInboxScreen extends StatelessWidget {
  const EmptyInboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(Get.height * 0.052),
                child: Text(
                  "Inbox",
                  style: AppTextStyle.headerStyleBlack24,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: Get.height * 0.052),
                child: Text(
                  AppText.inboxText,
                  style: AppTextStyle.greytext12,
                ),
              )
            ],
          )),
    );
  }
}
