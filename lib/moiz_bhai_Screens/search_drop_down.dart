import 'package:flutter/material.dart';

class SearchDropDown extends StatelessWidget {
  const SearchDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          // width: 270,
                          // height: 50,
                          // margin: const EdgeInsets.only(bottom: 400),
                          // Add margin to position the input field at the top
                          decoration: BoxDecoration(
                            color: const Color(0xffE5DDEE),
                            borderRadius: BorderRadius.circular(
                                30), // Set the border radius here
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Station Road or the Bridge'),
                              ],
                            ),
                          ),

                          // TextFormField(
                          //   textAlign: TextAlign.center,
                          //   // Align the text in the center
                          //   decoration: const InputDecoration(
                          //     hintText: 'Station Road or the Bridge',
                          //     hintStyle: TextStyle(
                          //       color: Colors.black,
                          //     ),
                          //     prefixIcon: Icon(
                          //       Icons.arrow_back_ios,
                          //       color: Colors.black,
                          //     ), // Adjust horizontal padding
                          //     border: InputBorder.none, // Remove the border color
                          //   ),
                          // ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            '1 Jail Road',
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: 8),
                          // Add some distance between the text and the arrow icon
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Add some vertical distance between the text input field and the hint text
                      const Text(
                        'Shadman, Lahore, Pakistan',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Add some vertical distance between the hint and the straight line
                      Container(
                        width: 100,
                        // Set the width of the straight line as per your requirement
                        height: 2,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
