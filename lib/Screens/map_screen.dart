import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sawari_app/Contollers/LocationControllers/location_controller.dart';
import 'package:sawari_app/Screens/drop_of_location.dart';
import 'package:sawari_app/Utilities/app_bar.dart';
import 'package:sawari_app/Utilities/forward_arrow.dart';

import '../Controllers/app_controller.dart';

class MapScreens extends StatefulWidget {
  const MapScreens({super.key});

  @override
  State<MapScreens> createState() => _MapScreensState();
}

late LocationController locationController;

class _MapScreensState extends State<MapScreens> {
  @override
  void initState() {
    locationController =
        Provider.of<LocationController>(context, listen: false);
    locationController.determinePosition();
    locationController.setCameraPosition();
    super.initState();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                "Where would you like to\npick up passengers?",
                style: AppTextStyle.headerStyleBlack24
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              height: 44,
              width: Get.width * 0.6,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFE5DDEE)),
                  borderRadius: BorderRadius.circular(55),
                ),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.black,
                      child: Text(
                        "?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Text(
                    "Why is an exact location better?",
                    style: AppTextStyle.blacktext12,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, right: 20),
              child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                // Add margin to position the input field at the top
                decoration: BoxDecoration(
                  color: const Color(0xffE5DDEE),
                  borderRadius:
                      BorderRadius.circular(30), // Set the border radius here
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Jail Road",
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ), // Adjust horizontal padding
                    border: InputBorder.none, // Remove the border color
                  ),
                ),
              ),
            ),
            Container(
              height: Get.height * 0.42,
              width: Get.width,
              child: Consumer<LocationController>(
                builder: (BuildContext context, value, Widget? child) {
                  return value.position != null
                      ? GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: value.cameraPosition ??
                              const CameraPosition(target: LatLng(0.0, 0.0)),
                          onMapCreated: (GoogleMapController controller) {
                            value.initMapController(controller);
                            value.setMarker();
                          },
                        )
                      : SizedBox();
                },
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                    onTap: () {
                      Get.to(const DropOfLocationScreen());
                    },
                    child: const ForwardArrow())),
          ],
        ),
      ),
    ));
  }
}
