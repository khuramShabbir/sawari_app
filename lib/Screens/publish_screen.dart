import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:place_picker/place_picker.dart';
import 'package:sawari_app/Contollers/AuthControllers/app_controller.dart';
import 'package:sawari_app/main.dart';

import '../Utilities/continue_button.dart';
import 'PaymentScreen/final_request_submitted.dart';

class PublishScreen extends StatefulWidget {
  PublishScreen({super.key});

  @override
  State<PublishScreen> createState() => _PublishScreenState();
}

class _PublishScreenState extends State<PublishScreen> {
  final TextEditingController pickUpLocationcontroller =
      TextEditingController();

  final TextEditingController destinationLocationcontroller =
      TextEditingController();

  void getPickUpLocation(String address) {
    pickUpLocationcontroller.text = address;
  }

  void getdestinationLocation(String address) {
    destinationLocationcontroller.text = address;
  }

  DateTime currentDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  String? selectedTime;

  Future<void> displayTimeDialog() async {
    final TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null) {
      setState(() {
        selectedTime = time.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: RichText(
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
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Pick Up Location',
                        style: AppTextStyle.blacktext18
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      TextField(
                        controller: pickUpLocationcontroller,
                        readOnly: true,
                        onTap: () async {
                          LocationResult? result = await Get.to(
                            () => PlacePicker(
                              "AIzaSyCWny4UpQAR8LeHs1sAIgZYwvlK9udsP8g",
                            ),
                          );
                          getPickUpLocation(
                              result?.formattedAddress ?? "Null Value");
                          logger.i(result?.latLng?.latitude ?? 0.0);
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Tap To select Location',
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Text('Destination',
                          style: AppTextStyle.blacktext18.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                      TextField(
                        controller: destinationLocationcontroller,
                        onTap: () async {
                          LocationResult? result = await Get.to(
                            () => PlacePicker(
                              "AIzaSyCWny4UpQAR8LeHs1sAIgZYwvlK9udsP8g",
                            ),
                          );
                          getdestinationLocation(
                              result?.formattedAddress ?? "Null Value");
                          logger.i(result?.latLng?.latitude ?? 0.0);
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Tap To select Location',
                        ),
                      ),
                      SizedBox(height: Get.height * 0.034),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              const SizedBox(width: 5),
                              InkWell(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: currentDate == null
                                    ? const Text('Select Date')
                                    : Row(
                                        children: [
                                          Text("${currentDate.day}"),
                                          Text(" - ${currentDate.month}"),
                                          Text(" - ${currentDate.year}"),
                                        ],
                                      ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.access_time_rounded),
                              const SizedBox(width: 5),
                              InkWell(
                                  onTap: () {
                                    displayTimeDialog();
                                  },
                                  child: selectedTime == null
                                      ? const Text('Select Time')
                                      : Text(selectedTime.toString())),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.034),
                      Row(
                        children: [
                          const Icon(Icons.person),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: "number of persons",
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.1,
                      ),
                      InkWell(
                          onTap: () {
                            Get.offAll(const FinalRequestSubmitScreen());
                          },
                          child: const ContinueButton()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
