import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sawari_app/Screens/map_screen.dart';
import 'package:sawari_app/Utilities/show_tost.dart';
import 'package:sawari_app/providers/publish_provider.dart';

import '../Contollers/AuthControllers/app_controller.dart';
import '../Utilities/app_bar.dart';
import '../Utilities/forward_arrow.dart';

class SetPriceScreen extends StatefulWidget {
  SetPriceScreen({Key? key}) : super(key: key);

  @override
  State<SetPriceScreen> createState() => _SetPriceScreenState();
}

class _SetPriceScreenState extends State<SetPriceScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bookingController.getDistanceAndTime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<BookingController>(builder: (____, data, __) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomAppBar(),
                Padding(
                  padding: EdgeInsets.only(
                      left: 10,
                      top: Get.height * 0.02,
                      bottom: Get.height * 0.05),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Set your price per seat",
                      style: AppTextStyle.headerStyleBlack24
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (data.price > 0) data.priceDecrement();
                          data.notifyListeners();
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: AppTextColors.primaryColor)),
                          child: const Center(child: Text("-")),
                        ),
                      ),
                      Text(
                        '${data.price ?? ""}',
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                      InkWell(
                        onTap: () {
                          data.priceIncrement();
                          data.notifyListeners();
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: AppTextColors.primaryColor)),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: AppTextColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: Get.height * 0.035,
                      width: Get.width * 0.66,
                      decoration: BoxDecoration(
                          color: const Color(0xFFA0D675),
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Recommended price:",
                            style: AppTextStyle.blacktext12,
                          ),
                          Text(
                            "RS3150 - RS3300",
                            style: AppTextStyle.blacktext12
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  "Perfect price for this ride! You’ll get passengers in\nno time.",
                  style: AppTextStyle.blacktext14,
                ),
                Expanded(
                  child: Container(),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                      onTap: () {
                        data.price == 0
                            ? showToast("Price Should not be empty")
                            : Get.to(MapScreens());
                      },
                      child: const ForwardArrow()),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
