import 'package:dio/dio.dart';
import 'package:salesapp_ca/data/models/responses/requestToken.dart';
import 'package:salesapp_ca/domain/repositories/remote/authentication_repository.dart';
import 'package:salesapp_ca/utils/dio.dart';

class AuthenticationApi extends AuthenticationRepository {
  final Dio _dio = dio;

  Future<RequestToken> validateWithLogin(
      String username, String password) async {
    final response = await _dio.post(
      '/login',
      data: {"usuario": username, "password": password},
    );
    return RequestToken.fromJson(response.data);
  }
}
