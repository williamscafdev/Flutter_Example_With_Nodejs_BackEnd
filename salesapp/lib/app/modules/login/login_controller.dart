import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesapp/app/data/models/responses/requestToken.dart';
import 'package:salesapp/app/data/repositories/local/local_auth_repository.dart';
import 'package:salesapp/app/data/repositories/remote/authentication_repository.dart';
import 'package:salesapp/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final AuthenticationRepository _authenticationRepository =
      Get.find<AuthenticationRepository>();
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  String _username = '', _password = '';

  void onUsernameChanged(String text) {
    _username = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<void> onSubmit() async {
    try {
      final RequestTokenModel authRequestToken = await _authenticationRepository
          .authWithLogin(username: _username, password: _password);
      await _localAuthRepository.setSession(authRequestToken);
      Get.offNamed(AppRoutes.HOME);
    } catch (e) {
      String message = "";
      if (e is DioError) {
        print(e.response);
        if (e.response != null) {
          message = e.response.data['response']['message'];
        } else {
          message = e.response.statusMessage;
        }
      }
      Get.dialog(
        AlertDialog(
          title: Text("Información del Sistema"),
          content: Text(message),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Get.back();
              },
            )
          ],
        ),
      );
    }
  }
}
