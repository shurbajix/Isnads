import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:isnad/Service/shared_service.dart';
import 'package:isnad/Singup/Rigester_API/Rigester_API.dart';
import 'package:isnad/log/config.dart';
import 'package:isnad/log/Login_as_Organization/Login_as_Organization.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(Login_as_Organization model) async {
    Map<String, String> requestHeader = {
      'content-type': 'application/json',
    };
    var url = Uri.http(
      Config.apiURL,
      Config.loginURL,
    );
    try {
      var response = await client.post(
        url,
        headers: requestHeader,
        body: jsonEncode(
          model.toJson(),
        ),
      );
      if (response.statusCode == 200) {
        await SharedService.setLoginDetails(
            Login_as_Organization(response.body));
        return true;
      } else {
        throw Exception('Failed to login: ${response.reasonPhrase}');
      }
    } catch (e) {
      print("Login Error: $e");
      throw Exception(
          'Failed to connect to the server. Please try again later.');
    }
  }

  static Future<RigesterAPI> register(RigesterAPI model) async {
    Map<String, String> requestHeader = {
      'content-type': 'application/json',
    };
    var url = Uri.http(
      Config.apiURL,
      Config.rigesterURL,
    );
    try {
      var response = await client.post(
        url,
        headers: requestHeader,
        body: jsonEncode(
          model.toJson(),
        ),
      );
      if (response.statusCode == 200) {
        return RigesterAPI.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to register: ${response.reasonPhrase}');
      }
    } catch (e) {
      print("Registration Error: $e");
      throw Exception(
          'Failed to connect to the server. Please try again later.');
    }
  }
}
