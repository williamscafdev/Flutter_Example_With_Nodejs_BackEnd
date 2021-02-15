import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesapp/app/utils/fade_animation.dart';
import 'local_widget/ButtonLogin.dart';
import 'local_widget/TextFieldPassword.dart';
import 'local_widget/TextFieldUserName.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.blue[900],
              Colors.blue[800],
              Colors.blue[500],
            ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('App GetX',
                          style: TextStyle(color: Colors.white, fontSize: 40)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Bienvenidos',
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 100),
                      child: Column(
                        children: [
                          FadeAnimation(
                            1.2,
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(30, 144, 255, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: [
                                  TextFieldUserName(
                                    onChangedUserName: _.onUsernameChanged,
                                  ),
                                  TextFieldPassword(
                                    onChangedPasssword: _.onPasswordChanged,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  FadeAnimation(
                                    1.7,
                                    Text(
                                      '¿Perdiste tu contraseña?',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  ButtonLogin(
                                    onSubmit: _.onSubmit,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
