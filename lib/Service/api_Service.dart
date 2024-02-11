import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:isnad/log/config.dart';
import 'package:isnad/log/loginAPI.dart';

class APIService {
  static var client = http.Client();
  static Future<bool> login(LoginAPI model) async {
    Map<String, String> requestHeader = {
      'contect-type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.loginURL);
    var responsive = await client.post(
      url,
      headers: requestHeader,
      body: jsonEncode(
        model.toJson(),
      ),
    );
    if (responsive.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
