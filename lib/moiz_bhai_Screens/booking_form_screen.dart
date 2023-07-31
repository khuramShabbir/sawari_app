import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/moiz_bhai_Screens/theme.dart';

import 'search_location.dart';

class BookingForm extends StatelessWidget {
  const BookingForm({Key? key}) : super(key: key);

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
                    const Text(
                      'Your pick of rides at',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'low prices.',
                      style: TextStyle(
                        fontSize: 24,
                        color: AppColors.primeColor,
                        fontWeight: FontWeight.w700,
                      ),
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
                          const Text(
                            'From',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
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
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter from location',
                              ),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.02),
                          const Text(
                            'To',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter to location',
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              const SizedBox(width: 5),
                              const Text('Select Date'),
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
                      backgroundColor: AppColors.primeColor,
                      foregroundColor: AppColors.primeColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      minimumSize: Size(Get.width, 70),
                    ),
                    child: const Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image(
                  image: AssetImage("assets/images/character.png"),
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
