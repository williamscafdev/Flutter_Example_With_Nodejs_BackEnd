import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salesapp_cariverpod/domain/usercase/auth_usecase.dart';

enum SplashState { none, existing_user, ini }

class SplashController extends StateNotifier<SplashState> {
  SplashController(this._authUseCase) : super(SplashState.ini) {
    init();
  }
  final AuthUseCase _authUseCase;

  init() async {
    await Future.delayed(Duration(seconds: 4));
    final result = await _authUseCase.onInit();
    if (result == 0) {
      return state = SplashState.none;
    } else if (result == 1) {
      return state = SplashState.existing_user;
    } else {
      return state = SplashState.none;
    }
  }
}
