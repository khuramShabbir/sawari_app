import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sawari_app/ModelClasses/get_all_vehicle_categories.dart';
import 'package:sawari_app/ModelClasses/vehicles/getAllVehicleTypes.dart';
import 'package:sawari_app/ModelClasses/vehicles/getVehicleMakeModel.dart';
import 'package:sawari_app/Utilities/app_bar.dart';
import 'package:sawari_app/Utilities/forward_arrow.dart';
import 'package:sawari_app/providers/addCarProvider.dart';

import '../../Contollers/AuthControllers/app_controller.dart';

class AddCarScreen extends StatefulWidget {
  const AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

AddCarProvider addCarCategory = Provider.of(Get.context!, listen: false);

class _AddCarScreenState extends State<AddCarScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addCarCategory.getAllVehicle();
    addCarCategory.getAllVehicleTypes();
  }

  Widget build(BuildContext context) {
    return SafeArea(child: Consumer<AddCarProvider>(builder: (__, data, ___) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const CustomAppBar(),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                if (data.getAllVehicleCategories != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Vehicle Category"),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: AppTextColors.primaryColor)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<Category>(
                            value: data.category,
                            onChanged: (value) {
                              data.category = value;
                              data.getMakeModels(value?.id);
                              setState(() {});
                              data.make = null;
                              data.vehicleModel = null;
                            },
                            items: data.getAllVehicleCategories?.data
                                ?.map((value) {
                              return DropdownMenuItem<Category>(
                                value: value,
                                child: Text(value.categoryName ?? ""),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                    ],
                  ),
                if (data.getVehicleMakeModel != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Vehicle Company"),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: AppTextColors.primaryColor)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<Make>(
                            value: data.make,
                            onChanged: (value) {
                              data.make = value;
                              setState(() {});
                            },
                            items: data.getVehicleMakeModel?.data?.map((value) {
                              return DropdownMenuItem<Make>(
                                value: value,
                                child: Text(value.companyName ?? ""),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                    ],
                  ),
                if (data.make != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Vehicle Company"),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: AppTextColors.primaryColor)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<VehicleModel>(
                            value: data.vehicleModel,
                            onChanged: (value) {
                              data.vehicleModel = value;
                              setState(() {});
                            },
                            items: data.make?.vehicleModels?.map((value) {
                              return DropdownMenuItem<VehicleModel>(
                                value: value,
                                child: Text(value.modelName ?? ""),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                    ],
                  ),
                if (data.make != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Vehicle Class"),
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(color: AppTextColors.primaryColor)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<Type>(
                            value: data.singleVehicleType,
                            onChanged: (value) {
                              data.singleVehicleType = value;
                              setState(() {});
                            },
                            items: data.vehicleTypes?.data?.map((value) {
                              return DropdownMenuItem<Type>(
                                value: value,
                                child: Text(value.typeName ?? ""),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                    ],
                  ),
                customTextField(data.colorController, "Car color"),
                customTextField(data.yearModelController, "Model Year"),
                customTextField(data.plateNoController, "Plate No"),
                Container(
                  height: Get.height * 0.23,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: AppTextColors.primaryColor)),
                  child: InkWell(
                    onTap: () async {
                      data.pickFrontImage();
                    },
                    child: data.frontImage != null
                        ? Image.file(File(data.frontImage!))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo_outlined,
                                size: Get.height * 0.07,
                                color:
                                    AppTextColors.primaryColor.withOpacity(0.2),
                              ),
                              Text(
                                "PUT IMAGE OF YOUR CAR'S COPY\n (FRONT)",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.blacktext14.copyWith(
                                    color: AppTextColors.primaryColor
                                        .withOpacity(0.4)),
                              )
                            ],
                          ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  height: Get.height * 0.23,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: AppTextColors.primaryColor)),
                  child: InkWell(
                    onTap: () async {
                      data.pickBackImage();
                    },
                    child: data.backImage != null
                        ? Image.file(File(data.backImage!))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo_outlined,
                                size: Get.height * 0.07,
                                color:
                                    AppTextColors.primaryColor.withOpacity(0.2),
                              ),
                              Text(
                                "PUT IMAGE OF YOUR CAR'S COPY\n (BACK)",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.blacktext14.copyWith(
                                    color: AppTextColors.primaryColor
                                        .withOpacity(0.4)),
                              )
                            ],
                          ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Container(
                  height: Get.height * 0.23,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: AppTextColors.primaryColor)),
                  child: InkWell(
                    onTap: () async {
                      data.pickCarImage();
                    },
                    child: data.carImage != null
                        ? Image.file(File(data.carImage!))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_a_photo_outlined,
                                size: Get.height * 0.07,
                                color:
                                    AppTextColors.primaryColor.withOpacity(0.2),
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
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                        onTap: () {
                          data.submitVehicle();
                        },
                        child: ForwardArrow()))
              ],
            ),
          ),
        ),
      );
    }));
  }

  Widget customTextField(
      TextEditingController textEditingController, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
