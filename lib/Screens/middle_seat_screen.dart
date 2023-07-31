import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sawari_app/Controllers/app_controller.dart';
import 'package:sawari_app/Screens/select_passengers_screen.dart';
import 'package:sawari_app/Utilities/app_bar.dart';

class MiddleSeatScreen extends StatelessWidget {
  const MiddleSeatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const CustomAppBar(),
                Padding(
                  padding: EdgeInsets.only(
                      top: Get.height * 0.02, bottom: Get.height * 0.08),
                  child: Text(
                    "Think comfort, keep the\nmiddle seat empty!",
                    style: AppTextStyle.headerStyleBlack24
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                Image.asset("assets/images/car_image.png"),
                SizedBox(
                  height: Get.height * 0.06,
                ),
                InkWell(
                  onTap: () {
                    Get.to(SelectPassengersScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Yes, sure!",
                          style: AppTextStyle.blacktext14.copyWith(
                              color: AppTextColors.primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 1,
                    width: Get.width,
                    color: Colors.grey.shade400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "No, I’ll squeeze in 3",
                        style: AppTextStyle.greytext12.copyWith(fontSize: 14),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
