import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utilities/forward_arrow.dart';
import 'middle_seat_screen.dart';

class PickUpScreen extends StatelessWidget {
  const PickUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("PICK UP TIME"),
            InkWell(
                onTap: () {
                  Get.to(MiddleSeatScreen());
                },
                child: ForwardArrow())
          ],
        ),
      ),
    );
  }
}
