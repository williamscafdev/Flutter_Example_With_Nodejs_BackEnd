import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:salesapp_setstate/domain/exceptions/auth_exception.dart';
import 'package:salesapp_setstate/domain/repositories/local/local_auth_repository.dart';
import 'package:salesapp_setstate/domain/repositories/remote/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUseCase {
  AuthUseCase(this._authenticationRepository, this._localAuthRepository);
  final AuthenticationRepository _authenticationRepository;
  final LocalAuthRepository _localAuthRepository;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String _username = '', _password = '';

  void changedUserName(String username) {
    _username = username;
  }

  void changedPassword(String password) {
    _password = password;
  }

  Future<int> onInit() async {
    await Future.delayed(Duration(seconds: 3));
    final requestToken = await _localAuthRepository.getSession();
    return requestToken;
  }

  Future<int> onSubmit() async {
    await Future.delayed(Duration(seconds: 3));
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      try {
        final authRequestToken = await _authenticationRepository
            .validateWithLogin(_username, _password);
        if (authRequestToken.status) {
          await _localAuthRepository.setSession(authRequestToken);
          return 1;
        } else {
          return 0;
        }
      } on DioError catch (dioError) {
        throw AppException.fromDioError(dioError);
      }
    } else {
      return 2;
    }
  }

  Future<bool> onLogout() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.clear();
    return true;
  }

  onDispose() {
    usernameController.clear();
    passwordController.clear();
  }
}
