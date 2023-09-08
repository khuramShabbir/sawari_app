import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Contollers/AuthControllers/app_controller.dart';

Future startProgress({bool barrierDismissible = true}) async {
  if (!Get.isDialogOpen!) await 0.delay();
  await 0.delay();
  await 0.delay();
  await Get.generalDialog(
      barrierDismissible: barrierDismissible,
      barrierLabel: "barrierLabel",
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Center(
          child: SpinKitCircle(itemBuilder: (BuildContext context, index) {
            return Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppTextColors.primaryColor),
            );
          }),
        );
      });
}

Future<void> stopProgress() async {
  if (Get.isDialogOpen!) Get.back();
}
