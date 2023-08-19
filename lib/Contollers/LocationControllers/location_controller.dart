import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends ChangeNotifier {
  Position? position;

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    position = await Geolocator.getCurrentPosition();
    notifyListeners();
  }

  GoogleMapController? mapController;

  void initMapController(GoogleMapController mapController) {
    this.mapController = mapController;
    notifyListeners();
  }

  Set<Marker>? marker;

  void setMarker() {
    marker?.add(const Marker(
        markerId: MarkerId(
      "current_location",
    )));
  }

  CameraPosition? cameraPosition;

  void setCameraPosition() {
    mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target:
                LatLng(position?.latitude ?? 0.0, position?.longitude ?? 0.0),
            zoom: 17)
        //17 is new zoom level
        ));
  }
}
