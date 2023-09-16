import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:place_picker/entities/location_result.dart';
import 'package:provider/provider.dart';
import 'package:sawari_app/ModelClasses/vehicles/getAllRegisteredVehicle.dart';
import 'package:sawari_app/providers/get_all_registered_cars.dart';

import '../ModelClasses/geo_coding/GeoCodingResponse.dart';

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
  bool ismiddleSeatEmpty = true;
  int vehicleTypeId = 0;

  DateTime selectedDate = DateTime.now();

  priceIncrement() => price = price + 10;

  priceDecrement() => price = price - 10;

  LocationResult? pickUpLocationResult;
  LocationResult? dropOffLocationResult;
  void getPickUpLocation(LocationResult? result) {
    pickUpLocationResult = result;
    pickUpLocationcontroller.text = result?.formattedAddress ?? "";
  }

  void getPessengerLocation(String address) {
    meetUpLocationcontroller.text = address;
  }

  void getdestinationLocation(LocationResult? result) {
    destinationLocationcontroller.text = result?.formattedAddress ?? "";
    dropOffLocationResult = result;
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

  Leg? geoCodingLegs;
  Future<Leg?> getDistanceAndTime() async {
    final url = 'https://maps.googleapis.com/maps/api/directions/json'
        '?origin=${pickUpLocationResult?.latLng?.latitude ?? 0.0},'
        '${pickUpLocationResult?.latLng?.longitude}'
        '&destination=${dropOffLocationResult?.latLng?.latitude ?? 0.0},'
        '${dropOffLocationResult?.latLng?.longitude ?? 0.0}'
        '&key=AIzaSyCWny4UpQAR8LeHs1sAIgZYwvlK9udsP8g';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Leg? legs =
          geoCodingResponseFromJson(response.body)?.routes?.first.legs?.first;
      geoCodingLegs = legs;
      notifyListeners();
      return legs;
    } else {
      return null;
    }
  }

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

  GetAllRegisteredVehicle? userVehicles;
  getUserCars() async {
    userVehicles = await vehicleProvider.getAllVehicles();
    notifyListeners();
  }
}
