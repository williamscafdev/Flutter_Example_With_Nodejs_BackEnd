import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salesapp_cariverpod/presentation/home/home_view.dart';
import 'package:salesapp_cariverpod/presentation/login/login_view.dart';
import '../../utils/colors_constants.dart';
import './controller/splash_controller.dart';
import '../provider_Riverpod/providers.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer(builder: (contet, watch, child) {
        final state = watch(localAuthNotifierProvider.state);
        if (state == SplashState.none) {
          print('build');
          return LoginView();
        } else if (state == SplashState.existing_user) {
          return HomeView();
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    "assets/logoimg/LogoLandPagesalesapp.png",
                    width: size.width * 0.7,
                    height: size.height * 0.7,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 30.0)),
                CircularProgressIndicator(
                    strokeWidth: 5,
                    valueColor: new AlwaysStoppedAnimation<Color>(gray)),
                Padding(padding: EdgeInsets.only(top: 40.0)),
              ],
            ),
          );
        }
      }),
    );
  }
}
