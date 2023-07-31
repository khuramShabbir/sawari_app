import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/app_controller.dart';
import '../Utilities/app_bar.dart';
import 'set_price_screen.dart';

class PassengerBookScreen extends StatelessWidget {
  const PassengerBookScreen({Key? key}) : super(key: key);

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
                const CustomAppBar(),
                Container(),
                Padding(
                  padding: EdgeInsets.only(
                      left: 14,
                      top: Get.height * 0.02,
                      bottom: Get.height * 0.08),
                  child: Text(
                    "Can passengers book\ninstantly?",
                    style: AppTextStyle.headerStyleBlack24
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                Center(child: Image.asset("assets/images/Ã‘Ã«Ã®Ã©_1.png")),
                SizedBox(
                  height: Get.height * 0.06,
                ),
                InkWell(
                  onTap: () {
                    Get.to(SetPriceScreen());
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
