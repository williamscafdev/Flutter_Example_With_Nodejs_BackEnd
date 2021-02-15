import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app/modules/splash/splash_Binfind.dart';
import 'app/modules/splash/splash_view.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/injection/dependency_injection.dart';

void main() {
  DependencyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GETX - Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashView(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    );
  }
}
