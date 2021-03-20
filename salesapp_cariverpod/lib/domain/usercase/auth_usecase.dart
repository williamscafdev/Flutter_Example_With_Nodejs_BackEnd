import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './../../domain/exceptions/auth_exception.dart';
import './../../domain/repositories/local/local_auth_repository.dart';
import './../../domain/repositories/remote/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUseCase {
  final AuthenticationRepository _authenticationRepository;
  final LocalAuthRepository _localAuthRepository;

  AuthUseCase(this._authenticationRepository, this._localAuthRepository);

  String _username = '', _password = '';

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void changedUserName(String username) {
    _username = username;
    print(_username);
  }

  void changedPassword(String password) {
    _password = password;
    print(_password);
  }

  Future<int> onInit() async {
    final requestToken = await _localAuthRepository.getSession();
    return requestToken;
  }

  Future<bool> onSubmit(String _username, String _password) async {
    try {
      final authRequestToken = await _authenticationRepository
          .validateWithLogin(_username, _password);
      if (authRequestToken.status == true) {
        await _localAuthRepository.setSession(authRequestToken);
        return true;
      } else {
        return false;
      }
    } on DioError catch (dioError) {
      throw AppException.fromDioError(dioError);
    }
  }

  Future<bool> onLogout() async {
    SharedPreferences _storage = await SharedPreferences.getInstance();
    await _storage.clear();
    return true;
  }

/*   onDispose() {
    usernameController.clear();
    passwordController.clear();
  } */
}
