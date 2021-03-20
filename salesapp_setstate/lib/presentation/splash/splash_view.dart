import 'package:flutter/material.dart';
import 'package:salesapp_setstate/data/services/local/local_auth_api.dart';
import 'package:salesapp_setstate/data/services/remote/authentication_api.dart';
import 'package:salesapp_setstate/domain/usercase/auth_usecase.dart';
import 'package:salesapp_setstate/presentation/home/home_view.dart';
import 'package:salesapp_setstate/presentation/login/login_view.dart';
import 'package:salesapp_setstate/utils/colors_constants.dart';
import 'package:salesapp_setstate/utils/navigator_utils.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() =>
      _SplashViewState(AuthUseCase(AuthenticationApi(), LocalAuthApi()));
}

class _SplashViewState extends State<SplashView> {
  final AuthUseCase _authUseCase;

  _SplashViewState(this._authUseCase);

  Future<void> _init() async {
    final result = await _authUseCase.onInit();
    if (result == 0) {
      popAllAndPush(context, LoginView());
    } else if (result == 1) {
      popAllAndPush(context, HomeView());
    } else {
      popAllAndPush(context, LoginView());
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _init();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
    );
  }
}
