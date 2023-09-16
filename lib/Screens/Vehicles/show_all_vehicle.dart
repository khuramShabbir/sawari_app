import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sawari_app/Contollers/AuthControllers/app_controller.dart';
import 'package:sawari_app/Utilities/app_bar.dart';
import 'package:sawari_app/providers/auth/authProvider.dart';
import 'package:sawari_app/providers/get_all_registered_cars.dart';

class ShowAllVehicle extends StatefulWidget {
  const ShowAllVehicle({super.key});

  @override
  State<ShowAllVehicle> createState() => _ShowAllVehicleState();
}

class _ShowAllVehicleState extends State<ShowAllVehicle> {
  GetAllRegisteredCarsProvider getAllRegisteredCarsProvider =
      Provider.of(Get.context!, listen: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllRegisteredCarsProvider.getAllVehicles();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<GetAllRegisteredCarsProvider>(builder: (__, body, ___) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const CustomAppBar(),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount:
                          body.getAllRegisteredVehicle?.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        var data = body.getAllRegisteredVehicle?.data?[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Get.height * 0.2,
                                  width: Get.width,
                                  child: Image.network(
                                      "${Api.baseUrl}/${data?.vehiclePhoto}"),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Name : ${data?.vehicleModel?.modelName}",
                                  style: AppTextStyle.blacktext20,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Color :${data?.color}",
                                  style: AppTextStyle.blacktext20,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Plate Number :${data?.plateNumber}",
                                  style: AppTextStyle.blacktext20,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
