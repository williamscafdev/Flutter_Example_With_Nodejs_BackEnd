import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesapp_ca/data/services/local/local_auth_api.dart';
import 'package:salesapp_ca/data/services/remote/authentication_api.dart';
import 'package:salesapp_ca/domain/usercase/auth_usecase.dart';
import 'package:salesapp_ca/presentation/home/home_view.dart';
import 'package:salesapp_ca/presentation/login/login_view.dart';
import 'package:salesapp_ca/presentation/splash/cubit/splash_cubit.dart';
import 'package:salesapp_ca/utils/colors_constants.dart';
import 'package:salesapp_ca/utils/navigator_utils.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) =>
          SplashCubit(AuthUseCase(AuthenticationApi(), LocalAuthApi()))..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, snapshot) {
          if (snapshot == SplashState.none) {
            print('build');
            popAllAndPush(context, LoginView());
          } else {
            popAllAndPush(context, HomeView());
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
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
          ),
        ),
      ),
    );
  }
}
