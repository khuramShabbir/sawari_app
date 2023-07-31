import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/moiz_bhai_Screens/theme.dart';

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
              const Text(
                'Welcome to',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Share',
                      style: TextStyle(
                        fontSize: 45,
                        color: AppColors.primeColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'Fare.',
                      style: TextStyle(
                        fontSize: 45,
                        color: AppColors.primeColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: TextFormField(
                    decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: AppColors.primeColor,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: AppColors.primeColor,
                  ),
                  prefixText: "+92  ",
                  prefixStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.primeColor,
                  )),
                )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: TextFormField(
                    decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: AppColors.primeColor,
                    ),
                  ),
                  hintText: 'Password',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: AppColors.primeColor,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.primeColor,
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
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          'Remember Me',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const SignUp();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primeColor,
                    foregroundColor: AppColors.primeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(55),
                    ),
                    minimumSize: Size(Get.width * 0.7, 50),
                  ),
                  child: const Text('Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ))),
              const SizedBox(
                height: 60,
              ),
              Text(
                'Or connect with google account',
                style: TextStyle(
                  color: AppColors.primeColor,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 70),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primeColor,
                        width: 2.0,
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/google.png",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Sign in with google',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don’t have an account?',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primeColor),
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
