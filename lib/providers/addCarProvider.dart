import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sawari_app/ModelClasses/get_all_vehicle_categories.dart';
import 'package:sawari_app/ModelClasses/vehicles/getAllVehicleTypes.dart';
import 'package:sawari_app/Utilities/show_tost.dart';
import 'package:sawari_app/providers/auth/authProvider.dart';
import 'package:sawari_app/providers/urls.dart';

import '../ModelClasses/vehicles/getVehicleMakeModel.dart';
import '../Utilities/pick_image.dart';

class AddCarProvider extends ChangeNotifier {
  GetAllVehicleCategories? getAllVehicleCategories;
  GetVehicleMakeModel? getVehicleMakeModel;

  // List<String> categories = ["Please Select Vehicle Category"];
  Category? category;

  TextEditingController colorController = TextEditingController();
  TextEditingController yearModelController = TextEditingController();
  TextEditingController plateNoController = TextEditingController();

  getAllVehicle() async {
    String? response = await Api.get(Urls.getAllvehicleCategory);
    if (response != null && response.isNotEmpty) {
      make = null;
      category = null;
      vehicleModel = null;
      getAllVehicleCategories = getAllVehicleCategoriesFromJson(response);
      notifyListeners();
    }
  }

  VehicleTypes? vehicleTypes;
  Type? singleVehicleType;
  getAllVehicleTypes() async {
    String? response = await Api.get(Urls.getVehicleByTypes);
    if (response != null && response.isNotEmpty) {
      vehicleTypes = vehicleTypesFromJson(response);
      notifyListeners();
    }
  }

  Make? make;
  VehicleModel? vehicleModel;

  getMakeModels(id) async {
    String? response = await Api.post(Urls.getAllMakesModel,
        body: {"vehicleCategoryId": "$id"});
    if (response != null && response.isNotEmpty) {
      getVehicleMakeModel = getVehicleMakeModelFromJson(response);
      notifyListeners();
    }
  }

  String? frontImage;
  String? backImage;
  String? carImage;

  void pickFrontImage() async {
    var image = await GetImage.getImage();
    if (image != null) {
      frontImage = image;
      notifyListeners();
    }
  }

  void pickBackImage() async {
    var image = await GetImage.getImage();
    if (image != null) {
      backImage = image;
      notifyListeners();
    }
  }

  void pickCarImage() async {
    var image = await GetImage.getImage();
    if (image != null) {
      carImage = image;
      notifyListeners();
    }
  }

  void submitVehicle() async {
    if (category == null ||
        make == null ||
        vehicleModel == null ||
        colorController.text.isEmpty ||
        yearModelController.text.isEmpty ||
        plateNoController.text.isEmpty ||
        backImage == null ||
        singleVehicleType == null ||
        frontImage == null ||
        carImage == null) {
      showToast("Please add all values");
      return;
    }

    Map<String, String> body = {
      'plateNumber': plateNoController.text,
      'registrationYear': yearModelController.text,
      'vehicleMakeId': "${make?.id.toString()}",
      'vehicleModelId': "${vehicleModel?.id.toString()}",
      'color': colorController.text,
      'vehicleTypeId': "${singleVehicleType?.id}",
      'vehicleCategoryId': "${category?.id.toString()}"
    };

    Map<String, String> files = {
      'vehiclePhoto': carImage ?? "",
      'certificateImageBack': backImage ?? "",
      'certificateImageFront': frontImage ?? "",
    };
    await Api.multiPartPost(Urls.addVehicle, body: body, files: files);
    Get.back();
  }
}
