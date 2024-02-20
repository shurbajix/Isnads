import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:isnad/log/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RigesterAPI {
  bool? success;
  Data? data;
  String? message;

  RigesterAPI({this.success, this.data, this.message});

  RigesterAPI.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? accessToken;
  User? user;
  String? tokenType;
  String? expiresAt;
  bool? smsSend;
  Null codeVerified;

  Data(
      {this.accessToken,
      this.user,
      this.tokenType,
      this.expiresAt,
      this.smsSend,
      this.codeVerified});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    tokenType = json['token_type'];
    expiresAt = json['expires_at'];
    smsSend = json['sms_send'];
    codeVerified = json['code_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token_type'] = tokenType;
    data['expires_at'] = expiresAt;
    data['sms_send'] = smsSend;
    data['code_verified'] = codeVerified;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? callingCode;
  Null mobile;
  String? image;
  bool? isVerified;
  Null codeVerified;
  bool? isOrganization;
  OrganizationType? organizationType;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.fullName,
      this.email,
      this.callingCode,
      this.mobile,
      this.image,
      this.isVerified,
      this.codeVerified,
      this.isOrganization,
      this.organizationType});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    email = json['email'];
    callingCode = json['calling_code'];
    mobile = json['mobile'];
    image = json['image'];
    isVerified = json['is_verified'];
    codeVerified = json['code_verified'];
    isOrganization = json['is_organization'];
    organizationType = json['organization_type'] != null
        ? OrganizationType.fromJson(json['organization_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['full_name'] = fullName;
    data['email'] = email;
    data['calling_code'] = callingCode;
    data['mobile'] = mobile;
    data['image'] = image;
    data['is_verified'] = isVerified;
    data['code_verified'] = codeVerified;
    data['is_organization'] = isOrganization;
    if (organizationType != null) {
      data['organization_type'] = organizationType!.toJson();
    }
    return data;
  }
}

class OrganizationType {
  int? id;
  String? title;
  String? image;
  int? sort;

  OrganizationType({this.id, this.title, this.image, this.sort});

  OrganizationType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['sort'] = sort;
    return data;
  }
}

class RigesterAPIcontroll extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController =
      TextEditingController(); // New controller for repeat password
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> rigesterWithEmail() async {
    try {
      if (passwordController.text != repeatPasswordController.text) {
        throw "Passwords do not match";
      }

      var headers = {
        'content-type': 'application/json',
      };
      var url = Uri.parse(Config.apiURL + Config.rigesterURL);
      Map body = {
        'full_name': nameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };
      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['access_token'];
          print(token);
          final SharedPreferences prefs = await _prefs;
          await prefs.setString('access_token', token);
          nameController.clear();
          emailController.clear();
          passwordController.clear();
          repeatPasswordController.clear();
        } else {
          throw jsonDecode(response.body)['message'] ??
              "هذا البريد الالكتروني تم حجزة من قبل شخص اخر";
        }
      } else {
        throw jsonDecode(response.body)['message'] ??
            "هذا البريد الالكتروني تم حجزة من قبل شخص اخر";
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        "errors",
        e.toString(),
        duration: const Duration(
          seconds: 3,
        ),
      );
    }
  }
}

// class RegisterAPI {
//   bool? success;
//   Data? data;
//   String? message;

//   RegisterAPI({
//     this.success,
//     this.data,
//     this.message,
//   });

//   factory RegisterAPI.fromJson(Map<String, dynamic> json) {
//     return RegisterAPI(
//       success: json['success'],
//       data: json['data'] != null ? Data.fromJson(json['data']) : null,
//       message: json['message'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'success': success,
//       'data': data != null ? data!.toJson() : null,
//       'message': message,
//     };
//   }
// }

// class Data {
//   String? accessToken;
//   User? user;
//   String? tokenType;
//   String? expiresAt;
//   bool? smsSend;
//   Null codeVerified;

//   Data({
//     this.accessToken,
//     this.user,
//     this.tokenType,
//     this.expiresAt,
//     this.smsSend,
//     this.codeVerified,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       accessToken: json['accessToken'],
//       user: json['user'] != null ? User.fromJson(json['user']) : null,
//       tokenType: json['tokenType'],
//       expiresAt: json['expiresAt'],
//       smsSend: json['smsSend'],
//       codeVerified: json['codeVerified'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'accessToken': accessToken,
//       'user': user != null ? user!.toJson() : null,
//       'tokenType': tokenType,
//       'expiresAt': expiresAt,
//       'smsSend': smsSend,
//       'codeVerified': codeVerified,
//     };
//   }
// }

// class User {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? fullName;
//   String? email;
//   String? callingCode;
//   Null mobile;
//   String? image;
//   bool? isVerified;
//   Null codeVerified;
//   bool? isOrganization;
//   OrganizationType? organizationType;

//   User({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.fullName,
//     this.email,
//     this.callingCode,
//     this.mobile,
//     this.image,
//     this.isVerified,
//     this.codeVerified,
//     this.isOrganization,
//     this.organizationType,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       firstName: json['firstName'],
//       lastName: json['lastName'],
//       fullName: json['fullName'],
//       email: json['email'],
//       callingCode: json['callingCode'],
//       mobile: json['mobile'],
//       image: json['image'],
//       isVerified: json['isVerified'],
//       codeVerified: json['codeVerified'],
//       isOrganization: json['isOrganization'],
//       organizationType: json['organizationType'] != null ? OrganizationType.fromJson(json['organizationType']) : null,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'firstName': firstName,
//       'lastName': lastName,
//       'fullName': fullName,
//       'email': email,
//       'callingCode': callingCode,
//       'mobile': mobile,
//       'image': image,
//       'isVerified': isVerified,
//       'codeVerified': codeVerified,
//       'isOrganization': isOrganization,
//       'organizationType': organizationType != null ? organizationType!.toJson() : null,
//     };
//   }
// }

// class OrganizationType {
//   int? id;
//   String? title;
//   String? image;
//   int? sort;

//   OrganizationType({this.id, this.title, this.image, this.sort});

//   factory OrganizationType.fromJson(Map<String, dynamic> json) {
//     return OrganizationType(
//       id: json['id'],
//       title: json['title'],
//       image: json['image'],
//       sort: json['sort'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'image': image,
//       'sort': sort,
//     };
//   }
// }
