import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../Controllers/app_controller.dart';
import '../Utilities/forward_arrow.dart';
import '../Utilities/round_corner_white_TextFormField.dart';
import 'final_request_submitted.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * 0.09,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text('Enter your phone\nnumber',
                style: AppTextStyle.headerStyleBlack24
                    .copyWith(fontWeight: FontWeight.w700)),
          ),
          SizedBox(
            height: Get.height * 0.08,
          ),
          RoundCornerWhiteTextFormField(
            prefix: false,
          ),
          SizedBox(
            height: Get.height * 0.22,
          ),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                  onTap: () {
                    Get.to(const FinalRequestSubmitScreen());
                  },
                  child: const ForwardArrow()),
            ),
          ),
        ],
      ),
    ));
  }
}
