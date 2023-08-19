import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'about_you_screen.dart';
import 'account_screen.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  bool pageview = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    pageview = true;
                    setState(() {});
                  },
                  child: Container(
                    height: 60,
                    color: Colors.white,
                    width: Get.width * 0.5,
                    child: const Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "     About you",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    pageview = false;
                    setState(() {});
                  },
                  child: Container(
                    height: 60,
                    color: Colors.white,
                    width: Get.width * 0.5,
                    child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("   Account",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500))),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 2,
                  width: Get.width * 0.5,
                  color: pageview ? Colors.black : Colors.white,
                ),
                Container(
                  height: 2,
                  width: Get.width * 0.5,
                  color: pageview ? Colors.white : Colors.black,
                ),
              ],
            ),
            pageview
                ? const Expanded(child: AboutYouScreen())
                : const Expanded(child: AccountScreen())
          ],
        ),
        // body: Column(
        //   children: [
        //     BottomNavigationBar(
        //       unselectedItemColor: AppTextColors.primaryColor,
        //       fixedColor: Colors.white,
        //       type: BottomNavigationBarType.fixed,
        //       backgroundColor: AppTextColors.bottomBarBackgroundColor,
        //       currentIndex: _currentIndex1,
        //       onTap: _onTabTapped,
        //       items: _buildBottomNavBarItems(),
        //     ),
        //     Expanded(
        //       child: PageView(
        //         controller: pageController,
        //         onPageChanged: _onPageChanged,
        //         children: const [
        //           AboutYouScreen(),
        //           AccountScreen(),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
