// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Screens/Sign_Up_Screens/code_verify_screen.dart';
import 'package:sawari_app/Screens/mainScreen.dart';
import 'package:sawari_app/Utilities/progress_diologes.dart';

import '../../Contollers/AuthControllers/app_controller.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode = const CountryCode(
    name: "Pakistan",
    code: "PK",
    dialCode: "+92",
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    Get.to(MainScreen());
                  },
                  child: Text('Welcome to', style: AppTextStyle.blacktext18)),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Share',
                      style: TextStyle(
                        fontSize: 45,
                        color: AppTextColors.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'Fare.',
                      style: TextStyle(
                        fontSize: 45,
                        color: AppTextColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Text('Join us via phone number', style: AppTextStyle.blacktext20),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        final code = await countryPicker.showPicker(
                          initialSelectedLocale: "PK",
                          context: context,
                        );
                        setState(() {
                          countryCode = code;
                        });
                      },
                      child: Container(
                        width: 52,
                        height: 47,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 10, right: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTextColors.primaryColor,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          countryCode?.dialCode ?? "",
                          style: AppTextStyle.blacktext20
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5, right: 10),
                        height: 55,
                        child: Center(
                          child: TextFormField(
                            style: AppTextStyle.blacktext20
                                .copyWith(fontWeight: FontWeight.w700),
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(top: 5, left: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppTextColors.primaryColor,
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppTextColors.primaryColor,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    // ignore: unnecessary_null_comparison
                    if (phoneNumberController.text == "") {
                      Get.defaultDialog(
                          title: "phone number is missing",
                          middleText: "Enter Phone Number");
                    } else {
                      startProgress();
                      auth.verifyPhoneNumber(
                          phoneNumber: countryCode!.dialCode +
                              phoneNumberController.text,
                          verificationCompleted: (_) {},
                          verificationFailed: (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(e.toString()),
                            ));
                          },
                          codeSent: (String verificationId, int? token) {
                            stopProgress();
                            Fluttertoast.showToast(msg: "OTP send");
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return CodeVerify(
                                verificationIdd: verificationId,
                                phoneNumber: phoneNumberController.text,
                              );
                            }));
                          },
                          codeAutoRetrievalTimeout: (e) {
                            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            //   content: Text(e.toString()),
                            // ));
                          });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTextColors.primaryColor,
                    foregroundColor: AppTextColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: Size(Get.width * 0.8, 50),
                  ),
                  child: Text('Login',
                      style: AppTextStyle.blacktext20
                          .copyWith(color: Colors.white))),
            ],
          ),
        ),
      ),
    );
  }
}
