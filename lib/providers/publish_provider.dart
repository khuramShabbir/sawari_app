import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

var bookingController =
    Provider.of<BookingController>(Get.context!, listen: false);

class BookingController extends ChangeNotifier {
  final TextEditingController pickUpLocationcontroller =
      TextEditingController();
  final TextEditingController destinationLocationcontroller =
      TextEditingController();

  final TextEditingController meetUpLocationcontroller =
      TextEditingController();

  String? selectedTime;
  int numberOfPassengers = 0;
  int price = 0;

  DateTime selectedDate = DateTime.now();

  priceIncrement() => price = price + 10;

  priceDecrement() => price = price - 10;

  void getPickUpLocation(String address) {
    pickUpLocationcontroller.text = address;
  }

  void getPessengerLocation(String address) {
    meetUpLocationcontroller.text = address;
  }

  void getdestinationLocation(String address) {
    destinationLocationcontroller.text = address;
  }

  Future<void> displayTimeDialog(context) async {
    final TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null) {
      selectedTime = time.format(context);
      notifyListeners();
    }
  }

  increment() => numberOfPassengers++;

  decrement() => numberOfPassengers--;

  Future<void> selectPickUpDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != selectedDate)
      selectedDate = pickedDate;
    notifyListeners();
  }
}
