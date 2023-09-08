import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sawari_app/Utilities/progress_diologes.dart';
import 'package:sawari_app/providers/storage/storage.dart';

class Api {
  static const String _baseUrl = "https://laundry.bhumanit.com/api/";

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
      print(response.body);
      stopProgress();
      if (response.statusCode == 200) {
        return response.body;
      } else {
        print(response.body);
        return null;
      }
    } catch (e) {
      stopProgress();
      return null;
    }
  }

  void loginUser(loginId, password) async {
    saveUser(
        await Api.post("", body: {"loginId": loginId, "password": password}));
  }

  void saveUser(String? response) async {
    if (response != null) {
      await write("", 4);
    }
  }
}
