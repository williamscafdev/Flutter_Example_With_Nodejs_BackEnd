import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salesapp_cariverpod/presentation/home/home_view.dart';
import 'package:salesapp_cariverpod/presentation/provider_Riverpod/providers.dart';
import 'package:salesapp_cariverpod/presentation/widgets/ProgressIndicator.dart';
import 'package:salesapp_cariverpod/presentation/widgets/ShowDialogMessage.dart';
import 'package:salesapp_cariverpod/utils/colors_constants.dart';
import 'package:salesapp_cariverpod/utils/navigator_utils.dart';

import 'controller/login_controller.dart';
import 'local_widget/ButtonLogin.dart';
import 'local_widget/CurvePainter.dart';
import 'local_widget/TextFieldPassword.dart';
import 'local_widget/TextFieldUserName.dart';

class LoginView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final loginController = watch(loginControllerNotifierProvider);
    //final authController = watch(authenticationRepositoryProvider);

    return ProviderListener<StateController<LoginState>>(
        provider: loginstateControllerNotifierProvider,
        onChange: (contxt, state) async {
          if (state.state == LoginState.logIn) {
            state.state = await loginController.logIn();
            switch (state.state) {
              case LoginState.typing:
                showDialogMessage(
                    context, 'Información', 'Ingrese usuario y contraseña.');
                break;
              case LoginState.existing_user:
                pushAndReplaceToPage(context, HomeView());
                break;
              case LoginState.none:
                Navigator.of(context).pop();
                break;
              case LoginState.userError:
                showDialogMessage(
                    context, 'Información', 'Error de usuario y/o contraseña.');
                break;
              case LoginState.error:
                showDialogMessage(
                    context, 'Información', 'Servidor sin respuesta.');
                break;
              case LoginState.logIn:
                print('logIn');
                break;
            }
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: GestureDetector(onTap: () {
            FocusScope.of(context).unfocus();
          }, child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.blue[900]!,
                Colors.blue[800]!,
                Colors.blue[600]!,
              ])),
              child: CustomPaint(
                painter: CurvePainter(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text('Sales App',
                              style: TextStyle(color: blackv2, fontSize: 40)),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Bienvenidos',
                              style: TextStyle(color: blackv2, fontSize: 20))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: blackv2,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              )),
                          child: Padding(
                            padding: EdgeInsets.all(30),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  30, 144, 255, .3),
                                              blurRadius: 20,
                                              offset: Offset(0, 10))
                                        ]),
                                    child: Column(
                                      children: [
                                        TextFieldUserName(
                                          usuarioController: loginController
                                              .usernameController,
                                          onChangedUserName: (value) => {
                                            loginController
                                                .changedUserName(value)
                                          },
                                        ),
                                        TextFieldPassword(
                                          passwordController: loginController
                                              .passwordController,
                                          secureText: true,
                                          onPressedIcon: () {},
                                          onChangedPasssword:
                                              loginController.changedPassword,
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text(
                                          '¿Perdiste tu contraseña?',
                                          style: TextStyle(
                                              fontFamily: 'Oswald',
                                              color: gray,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        ButtonLogin(
                                          value: true,
                                          onTap: () => context
                                              .read(
                                                  loginstateControllerNotifierProvider)
                                              .state = LoginState.logIn,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          //  onTap: _.onSignUp,
                                          child: Text(
                                            'Registrate',
                                            style: TextStyle(
                                                fontFamily: 'Oswald',
                                                color: Colors.blue,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          })),
        ));
  }
}

Widget mensaje() {
  return AlertDialog(
    title: Text('Procesando'),
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          CircularProgressIndicator(
              strokeWidth: 10,
              valueColor: new AlwaysStoppedAnimation<Color>(gray)),
        ],
      ),
    ),
  );
}
