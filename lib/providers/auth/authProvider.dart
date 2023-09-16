import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sawari_app/Screens/mainScreen.dart';
import 'package:sawari_app/Utilities/keys.dart';
import 'package:sawari_app/Utilities/progress_diologes.dart';
import 'package:sawari_app/providers/storage/storage.dart';
import 'package:sawari_app/providers/urls.dart';

import '../../Utilities/user_utils.dart';

class Api {
  static const String baseUrl = "http://3.142.160.221:8009";
  static getHeaders() {
    return {
      'content-type': 'application/json',
      'Authorization': "Bearer ${getUser()?.token}",
    };
  }

  static Future<String?> get(String path) async {
    try {
      startProgress();
      final response =
          await http.get(Uri.parse('$baseUrl$path'), headers: getHeaders());
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
      final response = await http.post(Uri.parse('$baseUrl$path'),
          headers: getHeaders(), body: json.encode(body));
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

  static Future<String?> multiPartPost(String path,
      {dynamic body, Map<String, String>? files}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse('$baseUrl$path'));
      request.fields.addAll(body);

      if (files != null) {
        files.forEach((key, value) async {
          request.files.add(await http.MultipartFile.fromPath(key, value));
        });
      }
      request.headers.addAll(getHeaders());

      startProgress();
      http.StreamedResponse response = await request.send();
      stopProgress();
      var responseBody = await response.stream.bytesToString();
      print(responseBody);
      if (response.statusCode == 200) {
        return responseBody;
      } else {
        print(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      stopProgress();
      print(e);
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
