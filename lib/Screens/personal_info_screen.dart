import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Utilities/forward_arrow.dart';

import '../Controllers/app_controller.dart';
import '../Utilities/app_bar.dart';
import '../Utilities/pick_image.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

TextEditingController namecontroller = TextEditingController();
TextEditingController bioController = TextEditingController();

String? selectedImage;
String? cnicImage;

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomAppBar(),
                InkWell(
                  onTap: () async {
                    await GetImage.getImage().then((value) {
                      selectedImage = value;
                      setState(() {});
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: AppTextColors.primaryColor,
                    backgroundImage: selectedImage != null
                        ? FileImage(File(selectedImage!))
                        : null,
                    radius: Get.height * 0.08,
                    child: selectedImage != null
                        ? null
                        : Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: Get.height * 0.05,
                          ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: TextFormField(
                      controller: namecontroller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: AppTextColors.primaryColor,
                          ),
                        ),
                        hintText: "Enter your name",
                        prefixStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppTextColors.primaryColor,
                        )),
                      )),
                ),
                Container(
                  height: Get.height * 0.25,
                  width: Get.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: AppTextColors.primaryColor)),
                  child: InkWell(
                    onTap: () async {
                      await GetImage.getImage().then((value) {
                        cnicImage = value;
                        setState(() {});
                      });
                    },
                    child: cnicImage != null
                        ? Image.file(File(cnicImage!))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo_outlined,
                                size: Get.height * 0.1,
                                color:
                                    AppTextColors.primaryColor.withOpacity(0.2),
                              ),
                              Text(
                                "ADD YOUR CNIC",
                                style: AppTextStyle.blacktext12.copyWith(
                                    color: AppTextColors.primaryColor
                                        .withOpacity(0.4)),
                              )
                            ],
                          ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: Get.height * 0.1,
                  width: Get.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: AppTextColors.primaryColor)),
                  child: TextFormField(
                      controller: bioController,
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        hintText: "Enter your bio",
                        prefixStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        border: InputBorder.none,
                      )),
                ),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                      alignment: Alignment.bottomRight, child: ForwardArrow()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
