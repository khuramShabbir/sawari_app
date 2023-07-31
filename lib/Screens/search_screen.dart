import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Controllers/app_controller.dart';
import 'package:sawari_app/Screens/ride_detail_screen.dart';

import '../Utilities/bidding_container_search_tab.dart';
import '../Utilities/search_screen_Top_container.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(Get.width * 0.063),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.01,
              ),
              const SearchScreenTopContainer(),
              SizedBox(
                height: Get.height * 0.022,
              ),
              Expanded(
                child: BiddingContainer(),
              ),
              InkWell(
                onTap: () {
                  Get.to(RideDetailScreen());
                },
                child: Container(
                  height: Get.height * 0.047,
                  width: Get.width * 0.44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border:
                          Border.all(color: Colors.grey.shade300, width: 2)),
                  child: Center(
                    child: Text(
                      "Create a ride alert",
                      style: AppTextStyle.blacktext14
                          .copyWith(color: AppTextColors.primaryColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
