import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sawari_app/ModelClasses/vehicles/getAllRegisteredVehicle.dart';
import 'package:sawari_app/providers/auth/authProvider.dart';
import 'package:sawari_app/providers/urls.dart';

var vehicleProvider =
    Provider.of<GetAllRegisteredCarsProvider>(Get.context!, listen: false);

class GetAllRegisteredCarsProvider extends ChangeNotifier {
  GetAllRegisteredVehicle? getAllRegisteredVehicle;

  Future<GetAllRegisteredVehicle?> getAllVehicles() async {
    String? response = await Api.get(Urls.getAllRegisteredVehiclesURL);
    if (response != null && response.isNotEmpty) {
      getAllRegisteredVehicle = getAllRegisteredVehicleFromJson(response);
      notifyListeners();
    }
    return getAllRegisteredVehicle;
  }
}
