import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesapp_ca/domain/exceptions/auth_exception.dart';
import 'package:salesapp_ca/domain/usercase/auth_usecase.dart';

enum LoginState {
  none,
  existing_user,
  userError,
  loading,
  error,
  typing,
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authUseCase) : super(LoginState.none);
  final AuthUseCase _authUseCase;

  void onSubmit() async {
    emit(LoginState.loading);
    await Future.delayed(Duration(seconds: 4));
    emit(LoginState.none);
    try {
      final result = await _authUseCase.onSubmit();
      if (result == true) {
        emit(LoginState.existing_user);
      } else {
        emit(LoginState.typing);
      }
    } on AppException catch (ex) {
      if (ex.message == '400') {
        emit(LoginState.userError);
      }
      emit(LoginState.error);
    }
  }
}
