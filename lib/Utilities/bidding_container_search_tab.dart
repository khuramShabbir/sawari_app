import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawari_app/Controllers/BiddingPersonModelClass.dart';
import 'package:sawari_app/Controllers/app_controller.dart';

class BiddingContainer extends StatelessWidget {
  BiddingContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 13.0),
        child: ListView.builder(
          itemCount: biddingPersonsData.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 2,
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            biddingPersonsData[index].startTime.toString(),
                            style: AppTextStyle.blacktext18
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: AppTextColors.primaryColor,
                                child: const CircleAvatar(
                                  radius: 4,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              Container(
                                height: 5,
                                width: Get.width * 0.2,
                                color: AppTextColors.primaryColor,
                              ),
                              CircleAvatar(
                                radius: 6,
                                backgroundColor: AppTextColors.primaryColor,
                                child: const CircleAvatar(
                                  radius: 4,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            biddingPersonsData[index].endTime.toString(),
                            style: AppTextStyle.blacktext18
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            biddingPersonsData[index].beginningCity.toString(),
                            style: AppTextStyle.blacktext12,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              roundContainer(),
                              roundContainer(),
                              roundContainer(),
                              roundContainer(),
                            ],
                          ),
                          Text(
                            biddingPersonsData[index]
                                .destinationCity
                                .toString(),
                            style: AppTextStyle.blacktext12,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        const CircleAvatar(),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                biddingPersonsData[index].name.toString(),
                                style: AppTextStyle.blacktext12,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 17,
                                  color: Colors.yellow.shade700,
                                ),
                                Text(
                                  biddingPersonsData[index].rating.toString(),
                                  style: AppTextStyle.blacktext12,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Column(
                          children: [
                            Text(
                              "PKR",
                              style: AppTextStyle.blacktext18.copyWith(
                                  color: AppTextColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${biddingPersonsData[index].totals.toString()}${"/-"}",
                              style: AppTextStyle.blacktext18
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ));
          },
        ));
  }

  Widget roundContainer() {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        height: 17,
        width: 17,
        decoration: BoxDecoration(
            color: AppTextColors.primaryColor,
            borderRadius: BorderRadius.circular(100)),
        child: const Icon(
          Icons.accessibility,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}
