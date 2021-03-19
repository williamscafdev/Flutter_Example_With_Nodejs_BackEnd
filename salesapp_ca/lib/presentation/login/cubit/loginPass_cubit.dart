import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubitPass extends Cubit<bool> {
  LoginCubitPass() : super(true);

  static final _vPass = true;

  static final _cPass = false;

  void viewPass() {
    emit(state ? _cPass : _vPass);
  }
}
