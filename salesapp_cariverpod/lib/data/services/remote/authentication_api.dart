import 'package:dio/dio.dart';
import '../../../data/models/responses/requestToken.dart';
import '../../../domain/repositories/remote/authentication_repository.dart';
import '../../../utils/dio.dart';

class AuthenticationApi implements AuthenticationRepository {
  final Dio _dio = dio;

  @override
  Future<RequestToken> validateWithLogin(
      String username, String password) async {
    final response = await _dio.post(
      '/login',
      data: {"usuario": username, "password": password},
    );
    return RequestToken.fromJson(response.data);
  }
}
