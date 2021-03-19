import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesapp_ca/domain/usercase/auth_usecase.dart';

enum SplashState { none, existing_user }

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._authUseCase) : super(SplashState.none);
  final AuthUseCase _authUseCase;

  void init() async {
    await Future.delayed(Duration(seconds: 4));
    final result = await _authUseCase.onInit();
    if (result == 0) {
      emit(SplashState.none);
    } else if (result == 1) {
      emit(SplashState.existing_user);
    } else {
      emit(SplashState.none);
    }
  }
}
