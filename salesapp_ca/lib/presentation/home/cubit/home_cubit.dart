import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesapp_ca/domain/usercase/auth_usecase.dart';

enum HomeState {
  none,
  logout,
}

class HomeCubitLogout extends Cubit<HomeState> {
  HomeCubitLogout(this._authUseCase) : super(HomeState.none);
  final AuthUseCase _authUseCase;
  void sessionClose() async {
    await _authUseCase.onLogout();
    await _authUseCase.onDispose();
    emit(HomeState.none);
  }

  void onLogout() async {
    emit(HomeState.none);
    emit(HomeState.logout);
  }
}
