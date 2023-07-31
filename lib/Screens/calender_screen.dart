import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Controllers/app_controller.dart';
import 'package:sawari_app/Plugins/Calancder/src/customization/calendar_style.dart';
import 'package:sawari_app/Plugins/Calancder/src/table_calendar.dart';
import 'package:sawari_app/Screens/pick_up_time_screen.dart';
import 'package:sawari_app/Utilities/forward_arrow.dart';
import 'package:sawari_app/moiz_bhai_Screens/theme.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back, color: AppColors.primeColor),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "When are you going?",
                style: AppTextStyle.headerStylePrimaryText24
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TableCalendar(
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                      color: AppColors.primeColor, shape: BoxShape.circle),
                ),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
              ),
              const SizedBox(height: 20),
              TableCalendar(
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                      color: AppColors.primeColor, shape: BoxShape.circle),
                ),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                      onTap: () {
                        Get.to(const PickUpTimeScreen());
                      },
                      child: const ForwardArrow()))
            ],
          ),
        ),
      ),
    );
  }
}
