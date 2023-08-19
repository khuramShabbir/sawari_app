import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/app_controller.dart';
import '../Forgot_Password/forget_pssword_screen.dart';
import '../personal_info_screen.dart';
import 'sign_up_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

bool checkbox = false;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to', style: AppTextStyle.blacktext18),
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: TextFormField(
                    decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: AppTextColors.primaryColor,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: AppTextColors.primaryColor,
                  ),
                  hintText: "+ 92",
                  prefixStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppTextColors.primaryColor,
                  )),
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: AppTextColors.primaryColor,
                        ),
                      ),
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppTextColors.primaryColor,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: AppTextColors.primaryColor,
                      )),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: checkbox,
                          onChanged: (onChanged) {
                            setState(() {
                              checkbox = !checkbox;
                            });
                          }),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text('Remember Me', style: AppTextStyle.blacktext12),
                      ),
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        Get.to(const ForgetPass());
                      },
                      child: Text('Forgot Password', style: AppTextStyle.blacktext12)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                      return SignUp();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTextColors.primaryColor,
                    foregroundColor: AppTextColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(55),
                    ),
                    minimumSize: Size(Get.width * 0.7, 50),
                  ),
                  child: Text('Sign Up',
                      style: AppTextStyle.blacktext18
                          .copyWith(color: Colors.white, fontWeight: FontWeight.bold))),
              // SizedBox(
              //   height: Get.height * 0.06,
              // ),
              // Text(
              //   'Or connect with google account',
              //   style: TextStyle(
              //     color: AppTextColors.primaryColor,
              //   ),
              // ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       height: 40,
              //       padding: const EdgeInsets.all(4),
              //       decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         border: Border.all(
              //           color: AppTextColors.primaryColor,
              //           width: 2.0,
              //         ),
              //       ),
              //       child: Image.asset(
              //         "assets/images/google.png",
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     Text(
              //       'Sign in with google',
              //       style: AppTextStyle.blacktext18
              //           .copyWith(fontWeight: FontWeight.bold),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: AppTextStyle.blacktext14,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const PersonalInfoScreen());
                    },
                    child: Text('Sign Up',
                        style: AppTextStyle.blacktext14.copyWith(
                            color: AppTextColors.primaryColor, fontWeight: FontWeight.w700)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
