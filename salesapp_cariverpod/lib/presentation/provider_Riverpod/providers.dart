import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salesapp_cariverpod/data/services/local/local_auth_api.dart';
import 'package:salesapp_cariverpod/data/services/remote/authentication_api.dart';
import 'package:salesapp_cariverpod/domain/usercase/auth_usecase.dart';
import 'package:salesapp_cariverpod/presentation/home/controller/home_controller.dart';
import 'package:salesapp_cariverpod/presentation/login/controller/login_controller.dart';
import 'package:salesapp_cariverpod/presentation/splash/controller/splash_controller.dart';

final authenticationRepositoryProvider = Provider<AuthUseCase>(
  (ref) => AuthUseCase(AuthenticationApi(), LocalAuthApi()),
);

final localAuthNotifierProvider = StateNotifierProvider.autoDispose(
  (ref) => SplashController(AuthUseCase(AuthenticationApi(), LocalAuthApi())),
);

final loginControllerNotifierProvider = StateNotifierProvider(
  (ref) => LoginController(AuthUseCase(AuthenticationApi(), LocalAuthApi())),
);

final homeControllerNotifierProvider = StateNotifierProvider<HomeController>(
    (ref) => HomeController(AuthUseCase(AuthenticationApi(), LocalAuthApi())));

final homestateControllerNotifierProvider =
    StateProvider.autoDispose<HomeState>((ref) {
  return HomeState.none;
});

final loginstateControllerNotifierProvider = StateProvider<LoginState>((ref) {
  return LoginState.none;
});
