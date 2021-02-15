import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'local_widget/ButtonLogout.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(children: [
            Text('HomeView'),
            SizedBox(
              height: 50,
            ),
            ButtonLogout(
              onSubmit: _.onLogout,
            ),
          ]),
        ),
      ),
    );
  }
}
