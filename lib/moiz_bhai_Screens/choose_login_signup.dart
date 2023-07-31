import 'package:flutter/material.dart';
import 'package:sawari_app/moiz_bhai_Screens/theme.dart';

import 'login_screen.dart';

class Chooseloginsignup extends StatelessWidget {
  const Chooseloginsignup({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage("assets/images/choose_login.jpeg"),
            width: 295,
            height: 254,
          ),
          const SizedBox(height: 30),
          const Text(
            'Your pick of rides at',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            'low prices.',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primeColor,
              foregroundColor: AppColors.primeColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(55),
              ),
              minimumSize: const Size(300, 50),
            ),
            child: const Text('Sign Up',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                )),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const Login();
              }));
            },
            child: const Text(
              'Login',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF7500F8),
              ),
            ),
          ),
        ],
      ))),
    );
  }
}
