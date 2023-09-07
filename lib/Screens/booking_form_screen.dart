import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:place_picker/place_picker.dart';
import 'package:sawari_app/Contollers/AuthControllers/app_controller.dart';
import 'package:sawari_app/Screens/search_location.dart';

class BookingForm extends StatefulWidget {
  BookingForm({Key? key}) : super(key: key);

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final TextEditingController pickUpLocController = TextEditingController();

  final TextEditingController dropLocController = TextEditingController();

  void PickUpAdress(String address) {
    pickUpLocController.text = address;
  }

  void DropOffAdress(String address) {
    dropLocController.text = address;
  }

  DateTime selectcurrentDate = DateTime.now();

  Future<void> selectCurrentDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectcurrentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != selectcurrentDate)
      setState(() {
        selectcurrentDate = pickedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your pick of rides at',
                      style: AppTextStyle.headerStyleBlack24
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'low prices.',
                      style: AppTextStyle.headerStylePrimaryText24,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black, width: 1),
                        left: BorderSide(color: Colors.black, width: 1),
                        right: BorderSide(color: Colors.black, width: 1),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From',
                            style: AppTextStyle.blacktext18
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: pickUpLocController,
                              readOnly: true,
                              onTap: () async {
                                LocationResult? result = await Get.to(
                                  () => PlacePicker(
                                    "AIzaSyCWny4UpQAR8LeHs1sAIgZYwvlK9udsP8g",
                                  ),
                                );
                                PickUpAdress(
                                    result?.formattedAddress ?? "Null Value");
                                // logger.i(result?.latLng?.latitude ?? 0.0);
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter from location',
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.02),
                          Text('To',
                              style: AppTextStyle.blacktext18.copyWith(
                                fontWeight: FontWeight.bold,
                              )),
                          Container(
                            height: 40,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: dropLocController,
                              readOnly: true,
                              onTap: () async {
                                LocationResult? result = await Get.to(
                                  () => PlacePicker(
                                    "AIzaSyCWny4UpQAR8LeHs1sAIgZYwvlK9udsP8g",
                                  ),
                                );
                                DropOffAdress(
                                    result?.formattedAddress ?? "Null Value");
                                // logger.i(result?.latLng?.latitude ?? 0.0);
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter from location',
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              const SizedBox(width: 5),
                              InkWell(
                                  onTap: () {
                                    selectCurrentDate(context);
                                  },
                                  child: selectcurrentDate == null
                                      ? const Text('Select Date')
                                      : Text("${selectcurrentDate}"
                                          .split(" ")
                                          .first)),
                              const SizedBox(width: 60),
                              const Text(
                                '|',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              const Icon(Icons.person),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const SearchLocation();
                      }));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTextColors.primaryColor,
                      foregroundColor: AppTextColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      minimumSize: Size(Get.width, 70),
                    ),
                    child: Text('Search',
                        style: AppTextStyle.blacktext18
                            .copyWith(color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image(
                  image: const AssetImage("assets/images/character.png"),
                  height: Get.height * 0.25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
