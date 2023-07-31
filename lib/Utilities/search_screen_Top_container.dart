import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sawari_app/Controllers/app_controller.dart';

class SearchScreenTopContainer extends StatelessWidget {
  const SearchScreenTopContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.082,
      width: Get.width,
      decoration: BoxDecoration(
          color: AppTextColors.searchBarBackgroundColor,
          borderRadius: BorderRadius.circular(150)),
      child: Padding(
        padding: EdgeInsets.only(
          left: Get.width * 0.06,
          right: Get.width * 0.02,
        ),
        child: Row(
          children: [
            const Icon(Icons.arrow_back_ios),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Lahore Gulberge",
                          style: AppTextStyle.blacktext12,
                        ),
                        const Icon(Icons.arrow_forward_rounded),
                        Expanded(
                          child: Text(
                            "Rawalpindi,Rawalpindi",
                            style: AppTextStyle.blacktext12,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                          ),
                        )
                      ],
                    ),
                    Text("Tomorrow 1 person", style: AppTextStyle.greytext12)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
