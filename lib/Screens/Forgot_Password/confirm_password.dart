import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Contollers/AuthControllers/app_controller.dart';
import '../mainScreen.dart';

class ConfirmPass extends StatefulWidget {
  const ConfirmPass({Key? key}) : super(key: key);

  @override
  State<ConfirmPass> createState() => _ConfirmPassState();
}

bool showpassword = true;
bool showConfirmpassword = true;

class _ConfirmPassState extends State<ConfirmPass> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.15,
              ),
              Text(
                'Forget Password?',
                style: AppTextStyle.blacktext20,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: TextFormField(
                  obscureText: showpassword,
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
                    suffixIcon: IconButton(
                      icon: InkWell(
                        onTap: () {
                          showpassword = !showpassword;
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.visibility,
                          color: Colors.black,
                          size: 17,
                        ),
                      ),
                      onPressed: () {
                        // Handle visibility toggle
                      },
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTextColors.primaryColor,
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextFormField(
                  obscureText: showConfirmpassword,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: AppTextColors.primaryColor,
                      ),
                    ),
                    hintText: 'Confirm Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: AppTextColors.primaryColor,
                    ),
                    suffixIcon: IconButton(
                      icon: InkWell(
                        onTap: () {
                          showConfirmpassword = !showConfirmpassword;
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.visibility,
                          color: Colors.black,
                          size: 17,
                        ),
                      ),
                      onPressed: () {
                        // Handle visibility toggle
                      },
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppTextColors.primaryColor,
                        width: 1.0,
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
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offAll(MainScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTextColors.primaryColor,
                  foregroundColor: AppTextColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: Size(Get.width * 0.75, 50),
                ),
                child: Text(
                  'Reset Password',
                  style: AppTextStyle.blacktext20.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
