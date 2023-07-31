import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Controllers/app_controller.dart';

import '../Utilities/continue_button.dart';
import '../Utilities/forward_arrow.dart';
import '../Utilities/round_corner_white_TextFormField.dart';
import 'payment_screen.dart';

class PayRideScreen extends StatelessWidget {
  const PayRideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: RichText(
                text: TextSpan(
                  text: 'How much you are\n',
                  style: AppTextStyle.headerStyleBlack24
                      .copyWith(fontWeight: FontWeight.w700),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'willing to',
                        style: AppTextStyle.headerStyleBlack24
                            .copyWith(fontWeight: FontWeight.w700)),
                    TextSpan(
                        text: ' pay ride',
                        style: AppTextStyle.headerStylePrimaryText24
                            .copyWith(fontWeight: FontWeight.w700)),
                    TextSpan(
                        text: ' for\n',
                        style: AppTextStyle.headerStyleBlack24
                            .copyWith(fontWeight: FontWeight.w700)),
                    TextSpan(
                        text: 'secure ride',
                        style: AppTextStyle.headerStylePrimaryText24
                            .copyWith(fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
            RoundCornerWhiteTextFormField(
              prefix: true,
            ),
            SizedBox(
              height: Get.height * 0.22,
            ),
            const ContinueButton(),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                    onTap: () {
                      Get.to(const PaymentScreen());
                    },
                    child: const ForwardArrow()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
