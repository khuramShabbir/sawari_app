import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/app_controller.dart';
import '../Screens/mainScreen.dart';

class ConfirmPass extends StatelessWidget {
  const ConfirmPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Forget Password?',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: TextFormField(
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
                      icon: const Icon(
                        Icons.visibility,
                        color: Colors.black,
                        size: 17,
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
                      icon: const Icon(
                        Icons.visibility,
                        color: Colors.black,
                        size: 17,
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return MainScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTextColors.primaryColor,
                  foregroundColor: AppTextColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: Size(Get.width * 0.75, 50),
                ),
                child: const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
