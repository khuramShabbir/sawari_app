// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../Controllers/app_controller.dart';
import '../Screens/mainScreen.dart';

class CodeVerify extends StatelessWidget {
  final String verificationIdd;

  CodeVerify({Key? key, required this.verificationIdd}) : super(key: key);

  bool loading = false;

  final phoneNumberController = TextEditingController();

  final auth = FirebaseAuth.instance;

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
                  Text('Are you new to',
                      style: AppTextStyle.blacktext18.copyWith(
                        fontWeight: FontWeight.w400,
                      )),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'ShareFare?',
                    style: AppTextStyle.blacktext18.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppTextColors.primaryColor),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Enter the 4-digit code sent to your',
                style: AppTextStyle.blacktext18
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              Text(
                'mobile number',
                style: AppTextStyle.blacktext18
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 30),
              Text(
                '+92 31234 5678',
                style: AppTextStyle.blacktext18
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              // Add a gap between the text and the text fields
              OTPTextField(
                controller: OtpFieldController(),
                length: 6,
                width: Get.width * 0.8,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 5,
                style: const TextStyle(fontSize: 17),
                onChanged: (pin) {},
                onCompleted: (pin) {
                  phoneNumberController.text = pin;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 90),
                  child: Text("Resend code in 0:12",
                      style: AppTextStyle.blacktext14)),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final credential = PhoneAuthProvider.credential(
                        verificationId: verificationIdd,
                        smsCode: phoneNumberController.text.toString());
                    try {
                      await auth.signInWithCredential(credential);
                      // ignore: use_build_context_synchronously
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return MainScreen();
                      }));
                      // ignore: empty_catches
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(e.toString()),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTextColors.primaryColor,
                    foregroundColor: AppTextColors.primaryColor,
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
