import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sawari_app/Contollers/AuthControllers/app_controller.dart';
import 'package:sawari_app/Screens/middle_seat_screen.dart';
import 'package:sawari_app/Utilities/app_bar.dart';
import 'package:sawari_app/Utilities/show_tost.dart';
import 'package:sawari_app/providers/auth/authProvider.dart';
import 'package:sawari_app/providers/publish_provider.dart';

import '../Utilities/forward_arrow.dart';

class SelectPassengersScreen extends StatefulWidget {
  SelectPassengersScreen({Key? key}) : super(key: key);

  @override
  State<SelectPassengersScreen> createState() => _SelectPassengersScreenState();
}

class _SelectPassengersScreenState extends State<SelectPassengersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bookingController.getUserCars();
  }

  int indexcolorvalue = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<BookingController>(builder: (context, data, __) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: CustomAppBar(),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.02, bottom: Get.height * 0.03),
                child: Text(
                  "Select your car",
                  style: AppTextStyle.headerStyleBlack24
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.userVehicles?.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      var vehicle = data.userVehicles!.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            indexcolorvalue = index;
                            data.vehicleTypeId = vehicle.vehicleMake?.id ?? 0;
                            setState(() {});
                            print(data.vehicleTypeId);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: indexcolorvalue == index
                                        ? Colors.grey
                                        : Colors.white)),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "${Api.baseUrl}/${vehicle.vehiclePhoto}"),
                                  radius: Get.height * 0.07,
                                ),
                                Text(
                                  "${vehicle.vehicleModel?.modelName}",
                                  style: AppTextStyle.blacktext20,
                                ),
                                Text(
                                  "${vehicle.vehicleMake?.companyName}",
                                  style: AppTextStyle.blacktext20,
                                ),
                                Text(
                                  "${vehicle.plateNumber}",
                                  style: AppTextStyle.blacktext20,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                height: 0.5,
                color: Colors.grey,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: Get.height * 0.05, bottom: Get.height * 0.08),
                      child: Text(
                        "So how many ShareFare\nPassengers can you take?",
                        style: AppTextStyle.headerStylePrimaryText24
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              if (data.numberOfPassengers > 0) data.decrement();
                              data.notifyListeners();
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: AppTextColors.primaryColor)),
                              child: const Center(child: Text("-")),
                            ),
                          ),
                          Text(
                            '${data.numberOfPassengers}',
                            style: const TextStyle(fontSize: 50),
                          ),
                          InkWell(
                            onTap: () {
                              data.increment();
                              data.notifyListeners();
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: AppTextColors.primaryColor)),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: AppTextColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                      onTap: () {
                        data.numberOfPassengers == 0
                            ? showToast("Select Atleast one Passemger")
                            : Get.to(const MiddleSeatScreen());
                      },
                      child: const ForwardArrow()),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
