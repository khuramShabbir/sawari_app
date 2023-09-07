import 'package:flutter/material.dart';
import 'package:sawari_app/Contollers/AuthControllers/app_controller.dart';
import 'package:sawari_app/Screens/ProfileScreen/profil_screen.dart';
import 'package:sawari_app/Screens/pick_up_location_screen.dart';

import 'ChatScreen/inboxScreen.dart';
import 'booking_form_screen.dart';
import 'your_tips_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<BottomNavigationBarItem> _buildBottomNavBarItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      const BottomNavigationBarItem(
        label: "Publish",
        icon: Icon(Icons.add),
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.car_crash_sharp),
        label: 'Your Tips',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.forward_to_inbox_outlined),
        label: 'Inbox',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          BookingForm(),
          PickUpLocation(),
          const YourTipsScreen(),
          const InboxScreen(),
          const ProfilScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppTextColors.primaryColor,
        fixedColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppTextColors.bottomBarBackgroundColor,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: _buildBottomNavBarItems(),
      ),
    );
  }
}
