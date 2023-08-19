import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sawari_app/Controllers/app_controller.dart';

class GetImage {
  static Future<String?> getImage() async {
    String? path;

    await Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();

                      XFile? xFile =
                          await picker.pickImage(source: ImageSource.camera);

                      path = xFile?.path;
                      if (Get.isBottomSheetOpen!) {
                        Get.back();
                      }
                    },
                    dense: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera,
                          color: AppTextColors.primaryColor,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          "Camera",
                          style: AppTextStyle.blacktext12,
                        ),
                      ],
                    ),
                  ),
                  Container(height: 1, color: AppTextColors.primaryColor),
                  ListTile(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();

                      XFile? xFile =
                          await picker.pickImage(source: ImageSource.gallery);

                      path = xFile?.path;
                      if (Get.isBottomSheetOpen!) {
                        Get.back();
                      }
                    },
                    dense: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_copy,
                          color: AppTextColors.primaryColor,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          "Gallery",
                          style: AppTextStyle.blacktext12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                onTap: () {
                  if (Get.isBottomSheetOpen!) Get.back();
                },
                dense: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cancel_outlined,
                      color: AppTextColors.primaryColor,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "Cancel",
                      style: AppTextStyle.blacktext12,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );

    return path;
  }
}
