import 'package:get/get.dart';
import 'package:salesapp/app/modules/home/home_binding.dart';
import 'package:salesapp/app/modules/home/home_view.dart';
import 'package:salesapp/app/modules/login/login_binding.dart';
import 'package:salesapp/app/modules/login/login_view.dart';
import 'package:salesapp/app/modules/splash/splash_Binfind.dart';
import 'package:salesapp/app/modules/splash/splash_view.dart';
part 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
