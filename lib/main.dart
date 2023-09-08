import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:sawari_app/Contollers/LocationControllers/location_controller.dart';
import 'package:sawari_app/Screens/Sign_Up_Screens/sign_up_screen.dart';
import 'package:sawari_app/Screens/mainScreen.dart';
import 'package:sawari_app/Utilities/keys.dart';
import 'package:sawari_app/providers/publish_provider.dart';

import 'providers/storage/storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationController()),
        ChangeNotifierProvider(create: (_) => BookingController()),
      ],
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: read(Keys.isUserLoggedIn) == null
              ? SignUpScreen()
              : MainScreen()),
    ),
  );
}

Logger logger = Logger();
