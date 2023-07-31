import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Screens/number_of_seats_screen.dart';

class SearchLocation extends StatelessWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  // Add margin to position the input field at the top
                  decoration: BoxDecoration(
                    color: const Color(0xffE5DDEE),
                    borderRadius:
                        BorderRadius.circular(30), // Set the border radius here
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Search Location",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.navigate_before,
                        color: Colors.black,
                      ), // Adjust horizontal padding
                      border: InputBorder.none, // Remove the border color
                    ),
                  ),
                ),

                // Your other widgets can be added here

                Container(
                  margin: const EdgeInsets.only(bottom: 450),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.gps_fixed,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(NumberOfScreens());
                        },
                        child: const Text(
                          'Use current location',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 12),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 100), // Adjust spacing between text and icon
                        child: Icon(
                          Icons.navigate_next,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
