import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:sawari_app/Contollers/LocationControllers/location_controller.dart';
import 'package:sawari_app/providers/publish_provider.dart';

import 'Screens/Sign_Up_Screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationController()),
        ChangeNotifierProvider(create: (_) => BookingController()),
      ],
      child: const GetMaterialApp(
          debugShowCheckedModeBanner: false, home: SplashScreen()),
    ),
  );
}

Logger logger = Logger();
