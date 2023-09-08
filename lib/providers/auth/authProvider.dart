import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sawari_app/Screens/mainScreen.dart';
import 'package:sawari_app/Utilities/keys.dart';
import 'package:sawari_app/Utilities/progress_diologes.dart';
import 'package:sawari_app/providers/storage/storage.dart';
import 'package:sawari_app/providers/urls.dart';

class Api {
  static const String _baseUrl = "http://51.20.36.43:8009";

  static final _headers = {'content-type': 'application/json'};

  static Future<String?> get(String path) async {
    try {
      startProgress();
      final response =
          await http.get(Uri.parse('$_baseUrl$path'), headers: _headers);
      stopProgress();
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      stopProgress();
      print(e);
      return null;
    }
  }

  static Future<String?> post(String path, {dynamic body}) async {
    try {
      startProgress();
      final response = await http.post(Uri.parse('$_baseUrl$path'),
          headers: _headers, body: json.encode(body));
      var bodyResponse = response.body;

      print(bodyResponse);
      stopProgress();
      if (response.statusCode == 200) {
        return bodyResponse;
      } else {
        print(bodyResponse);
        return null;
      }
    } catch (e) {
      stopProgress();
      return null;
    }
  }

  static void loginUser(loginId, phone) async {
    saveUser(await Api.post(Urls.loginUser, body: {
      "loginId": loginId,
      "isSocialLogin": true,
      "socialType": "PHONE",
      "mobileNumber": phone,
    }));
  }

  static void saveUser(String? response) async {
    if (response != null) {
      await write(Keys.isUserLoggedIn, response);
      Get.offAll(MainScreen());
    }
  }
}
