import 'package:flutter_bloc/flutter_bloc.dart';

enum LoginValidationState {
  confirm,
  error,
  none,
}

class LoginValidationCubit extends Cubit<LoginValidationState> {
  LoginValidationCubit() : super(LoginValidationState.none);

  void init() {}
}
