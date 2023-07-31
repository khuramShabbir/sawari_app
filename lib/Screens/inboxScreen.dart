import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Controllers/app_controller.dart';
import 'package:sawari_app/Screens/chatScreen.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

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
                padding: EdgeInsets.all(Get.height * 0.05),
                child: Text(
                  "Inbox",
                  style: AppTextStyle.headerStyleBlack24,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
                child: InkWell(
                  onTap: () {
                    Get.to(ChatScreen());
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey.shade400,
                          child: const Icon(
                            Icons.account_circle_outlined,
                            color: Colors.white,
                            size: 38,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Waqas Ahmad",
                              style: AppTextStyle.blacktext14
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Muje apki ride mil gayi hai me aphai me apko location confirm krta ho…",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              softWrap: false,
                              style: AppTextStyle.blacktext12
                                  .copyWith(color: Colors.grey, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "15 min",
                            style:
                                AppTextStyle.greytext12.copyWith(fontSize: 11),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 10,
                              child: Text("1"),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(child: Container()),
              Center(
                child: Text(
                  "Your chat will be archived 24 Hours after the trip.",
                  style: AppTextStyle.greytext12,
                ),
              ),
              Container(
                height: Get.height * 0.06,
              )
            ],
          )),
    );
  }
}
