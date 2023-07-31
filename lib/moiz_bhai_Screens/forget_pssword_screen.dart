import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/moiz_bhai_Screens/theme.dart';

import 'confirm_password.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Forget Password?',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              )),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Row(
              children: [
                Container(
                  width: 53,
                  height: 47,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 10, right: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primeColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: const Text(
                    '+92',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 5, right: 10),
                    height: 47,
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(top: 5, left: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primeColor,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.primeColor,
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
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const ConfirmPass();
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
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ))),
        ]),
      ),
    ));
  }
}
