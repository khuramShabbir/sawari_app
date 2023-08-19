import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Utilities/app_bar.dart';
import 'package:sawari_app/Utilities/forward_arrow.dart';

import '../Controllers/app_controller.dart';
import '../Utilities/pick_image.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

TextEditingController carModelController = TextEditingController();
TextEditingController carNameController = TextEditingController();
TextEditingController carColorController = TextEditingController();
TextEditingController carNumberController = TextEditingController();

String? carImage;

class _AddCarScreenState extends State<AddCarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8.0, left: 10),
              child: CustomAppBar(),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              height: Get.height * 0.23,
              width: Get.width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: AppTextColors.primaryColor)),
              child: InkWell(
                onTap: () async {
                  await GetImage.getImage().then((value) {
                    carImage = value;
                    setState(() {});
                  });
                },
                child: carImage != null
                    ? Image.file(File(carImage!))
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo_outlined,
                            size: Get.height * 0.1,
                            color: AppTextColors.primaryColor.withOpacity(0.2),
                          ),
                          Text(
                            "PUT IMAGE OF YOUR CAR",
                            style: AppTextStyle.blacktext12.copyWith(
                                color: AppTextColors.primaryColor
                                    .withOpacity(0.4)),
                          )
                        ],
                      ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            CustomTextField(carNameController, "Car Name"),
            CustomTextField(carNumberController, "Car Number"),
            CustomTextField(carModelController, "Car Model"),
            CustomTextField(carColorController, "Car Color"),
            SizedBox(
              height: Get.height * 0.05,
            ),
            const Padding(
              padding: EdgeInsets.all(30.0),
              child: Align(
                  alignment: Alignment.bottomRight, child: ForwardArrow()),
            )
          ],
        ),
      ),
    ));
  }

  Widget CustomTextField(
      TextEditingController textEditingController, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: AppTextColors.primaryColor,
              ),
            ),
            hintText: hintText,
            prefixStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: AppTextColors.primaryColor,
            )),
          )),
    );
  }
}
