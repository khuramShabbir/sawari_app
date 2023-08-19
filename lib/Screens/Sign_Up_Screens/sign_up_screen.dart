// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Screens/Sign_Up_Screens/code_verify_screen.dart';

import '../../Controllers/app_controller.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Join us via phone number', style: AppTextStyle.blacktext20),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        final code =
                            await countryPicker.showPicker(context: context);
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
                    } else if (countryCode == null) {
                      Get.defaultDialog(
                          title: "phone code is missing",
                          middleText: "Enter Phone Code");
                    } else {
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
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return CodeVerify(
                                verificationIdd: verificationId,
                              );
                            }));
                          },
                          codeAutoRetrievalTimeout: (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(e.toString()),
                            ));
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
                  child: Text('Submit',
                      style: AppTextStyle.blacktext20
                          .copyWith(color: Colors.white))),
              // const SizedBox(
              //   height: 55,
              // ),
              // Text(
              //   'Or connect with google account',
              //   style: TextStyle(
              //     color: AppTextColors.primaryColor,
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SizedBox(height: Get.height * 0.1),
              //     Container(
              //       height: 40,
              //       decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         border: Border.all(
              //           color: AppTextColors.primaryColor,
              //           width: 2.0,
              //         ),
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.all(4.0),
              //         // Adjust the padding as needed
              //         child: Image.asset(
              //           "assets/images/google.png",
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     Text(
              //       'Sign in with google',
              //       style: AppTextStyle.blacktext20
              //           .copyWith(fontWeight: FontWeight.w700),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: AppTextStyle.blacktext14,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Sign in',
                    style: AppTextStyle.blacktext14.copyWith(
                        color: AppTextColors.primaryColor,
                        fontWeight: FontWeight.w700),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
