import 'dart:convert';

import 'package:salesapp_ca/data/models/responses/requestToken.dart';
import 'package:salesapp_ca/domain/repositories/local/local_auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const KEY = "session";

class LocalAuthApi extends LocalAuthRepository {
  static const KEY = "session";
  @override
  Future<void> clearSession() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.remove(KEY);
  }

  Future<int> getSession() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();

    final String? data = _storage.get(KEY) as String?;

    if (data != null) {
      final RequestToken requestToken = RequestToken.fromJson(jsonDecode(data));
      final DateTime currentDate = DateTime.now();
      final DateTime createdAt = requestToken.createAt;
      final int expiresIn = requestToken.expire;
      final int diff = currentDate.difference(createdAt).inSeconds;

      if (expiresIn - diff >= 30) {
        return 1;
      } else {
        return 0;
      }
    }
    return 2;
  }

  Future<RequestToken> setSession(RequestToken requestToken) async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.setString(KEY, jsonEncode(requestToken.toJson()));
    return requestToken;
  }
}
