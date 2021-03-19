import 'package:flutter/material.dart';
import 'package:salesapp_ca/presentation/home/home_view.dart';
import 'package:salesapp_ca/presentation/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.SPLASH:
        return MaterialPageRoute(builder: (_) => SplashView());
      case AppRoutes.LOGIN:
        return MaterialPageRoute(builder: (_) => SplashView());
      case AppRoutes.HOME:
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return MaterialPageRoute(builder: (_) => SplashView());
    }
  }
}
