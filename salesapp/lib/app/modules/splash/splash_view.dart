import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesapp/app/utils/responsive.dart';

import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    final width = responsive.wp(70);
    final height = responsive.hp(70);
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(
                  "assets/logoimg/LogoGetX.png",
                  width: width,
                  height: height,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              CircularProgressIndicator(
                  strokeWidth: 5,
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Colors.blueAccent)),
              Padding(padding: EdgeInsets.only(top: 40.0)),
              Text(
                "GETX - Flutter",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
