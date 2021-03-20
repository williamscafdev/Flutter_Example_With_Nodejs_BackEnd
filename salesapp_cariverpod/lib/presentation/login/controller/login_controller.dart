import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salesapp_cariverpod/domain/exceptions/auth_exception.dart';
import 'package:salesapp_cariverpod/domain/usercase/auth_usecase.dart';

enum LoginState {
  none,
  logIn,
  existing_user,
  userError,
  typing,
  error,
}

class LoginController extends StateNotifier<LoginState> {
  LoginController(this._authUseCase) : super(LoginState.none);

  final AuthUseCase _authUseCase;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String _username = '', _password = '';
  void changedUserName(String username) {
    _username = username;
  }

  void changedPassword(String password) {
    _password = password;
  }

  logIn() async {
    if (usernameController.text.isEmpty && passwordController.text.isEmpty) {
      return LoginState.typing;
    }
    //await Future.delayed(Duration(seconds: 4));
    try {
      final result = await _authUseCase.onSubmit(_username, _password);
      print(result);
      if (result) {
        onDispose();
        return LoginState.existing_user;
      } else {
        return LoginState.userError;
      }
    } on AppException catch (ex) {
      if (ex.message == '400') {
        return LoginState.userError;
      }
      return LoginState.error;
    }
  }

  onDispose() {
    usernameController.clear();
    passwordController.clear();
    //super.dispose();
  }
}
