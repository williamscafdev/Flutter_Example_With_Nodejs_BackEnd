import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;
import 'package:salesapp/app/data/models/responses/requestToken.dart';

class AuthenticationAPI {
  final Dio _dio = Get.find<Dio>();

  Future<RequestTokenModel> validateWithLogin(
      {@required String username, @required String password}) async {
    final response = await _dio.post(
      '/login',
      data: {"usuario": username, "password": password},
    );
    return RequestTokenModel.fromJson(response.data);
  }
}
