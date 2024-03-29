import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesapp_ca/routes/app_pages.dart';
import 'package:salesapp_ca/utils/dependencies.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: buildRepositories(),
      child: Builder(builder: (newContext) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sales App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: AppPages.generateRoute,
          initialRoute: AppRoutes.SPLASH,
        );
      }),
    );
  }
}
