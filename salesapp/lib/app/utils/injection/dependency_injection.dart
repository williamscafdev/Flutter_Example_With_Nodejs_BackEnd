import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:salesapp/app/data/providers/local/local_auth.dart';
import 'package:salesapp/app/data/providers/remote/authentication_api.dart';
import 'package:salesapp/app/data/repositories/local/local_auth_repository.dart';
import 'package:salesapp/app/data/repositories/remote/authentication_repository.dart';

class DependencyInjection {
  static void init() {
    Get.put<Dio>(Dio(BaseOptions(baseUrl: 'http://192.168.13.2:3000/Api/v1')));

    // providers
    Get.put<AuthenticationAPI>(AuthenticationAPI());
    Get.put<LocalAuth>(LocalAuth());

    /// repositories
    Get.put<AuthenticationRepository>(AuthenticationRepository());
    Get.put<LocalAuthRepository>(LocalAuthRepository());
  }
}
