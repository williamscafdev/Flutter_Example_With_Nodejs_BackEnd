import 'dart:convert';

import 'package:get/get.dart';
import 'package:salesapp/app/data/models/responses/requestToken.dart';
import 'package:salesapp/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalAuth {
  static const KEY = "session";
  Future<void> setSession(RequestTokenModel requestToken) async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.setString(KEY, jsonEncode(requestToken.toJson()));
  }

  Future<void> clearSession() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.remove(KEY);
  }

  Future<RequestTokenModel> getSession() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    final String data = await _storage.get(KEY);
    if (data != null) {
      final RequestTokenModel requestToken =
          RequestTokenModel.fromJson(jsonDecode(data));
      final DateTime currentDate = DateTime.now();
      final DateTime createdAt = requestToken.createAt;
      final int expiresIn = requestToken.expire;
      final int diff = currentDate.difference(createdAt).inSeconds;
      if (expiresIn - diff >= 30) {
        //print("token alive");
        print("token alive ${expiresIn - diff}");
        return requestToken;
      } else {
        Get.offAllNamed(AppRoutes.LOGIN);
      }
      return null;
    }
    return null;
  }
}
