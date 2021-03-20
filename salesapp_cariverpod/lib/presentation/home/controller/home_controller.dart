import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salesapp_cariverpod/domain/usercase/auth_usecase.dart';

enum HomeState {
  none,
  logout,
}

class HomeController extends StateNotifier<HomeState> {
  HomeController(this._authUseCase) : super(HomeState.none);
  final AuthUseCase _authUseCase;

  void sessionClose() async {
    await _authUseCase.onLogout();
    state = HomeState.none;
  }
}
