import 'dart:convert';
import 'dart:ffi';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:isnad/Service/api_Service.dart';
import 'package:isnad/Singup/Rigester_API/Rigester_API.dart';
import 'package:isnad/log/Login_as_Organization/Login_as_Organization.dart';

class SharedService {
  static Future<bool> isLoggined() async {
    var isKeyExited =
        await APICacheManager().isAPICacheKeyExist('login_details');

    return isKeyExited;
  }

  static Future<Login_as_Organization?> loginDetails() async {
    var isKeyExited =
        await APICacheManager().isAPICacheKeyExist('login_details');
    if (isKeyExited) {
      var cacheData = await APICacheManager().getCacheData('login_details');

      return Login_as_Organization(cacheData.syncData);
    }
    return null;
  }

  static Future<void> setLoginDetails(
    Login_as_Organization model,
  ) async {
    APICacheDBModel cacheDBModel = APICacheDBModel(
      key: "login_details",
      syncData: jsonEncode(
        model.toJson(),
      ),
    );
    await APICacheManager().addCacheData(cacheDBModel);
  }

  static Future<void> logout(BuildContext context) async {
    await APICacheManager().deleteCache(
      "login_details",
    );
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/Obsscreen',
      (route) => false,
    );
  }
}
