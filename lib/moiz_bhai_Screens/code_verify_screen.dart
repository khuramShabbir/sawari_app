import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sawari_app/moiz_bhai_Screens/theme.dart';

import 'forget_pssword_screen.dart';

class CodeVerify extends StatelessWidget {
  const CodeVerify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Are you new to',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'ShareFare?',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primeColor),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Enter the 4-digit code sent to your',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                ),
              ),
              const Text(
                'mobile number',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 19,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                '+92 31234 5678',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              // Add a gap between the text and the text fields
              OTPTextField(
                length: 4,
                width: Get.width * 0.8,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 5,
                style: TextStyle(fontSize: 17),
                onChanged: (pin) {},
                onCompleted: (pin) {},
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 90),
                child: Text("Resend code in 0:12",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const ForgetPass();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primeColor,
                    foregroundColor: AppColors.primeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: Size(Get.width * 0.7, 50),
                  ),
                  child: const Text('Submit',
                      style: TextStyle(
                        color: Colors.white,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
