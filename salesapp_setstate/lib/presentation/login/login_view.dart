import 'package:flutter/material.dart';
import 'package:salesapp_setstate/data/services/local/local_auth_api.dart';
import 'package:salesapp_setstate/data/services/remote/authentication_api.dart';
import 'package:salesapp_setstate/domain/exceptions/auth_exception.dart';
import 'package:salesapp_setstate/domain/usercase/auth_usecase.dart';
import 'package:salesapp_setstate/presentation/home/home_view.dart';
import 'package:salesapp_setstate/presentation/widgets/ShowDialogMessage.dart';
import 'package:salesapp_setstate/utils/colors_constants.dart';
import 'package:salesapp_setstate/utils/dialogs.dart';
import 'package:salesapp_setstate/utils/navigator_utils.dart';
import 'local_widget/ButtonLogin.dart';
import 'local_widget/CurvePainter.dart';
import 'local_widget/TextFieldPassword.dart';
import 'local_widget/TextFieldUserName.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() =>
      _LoginViewState(AuthUseCase(AuthenticationApi(), LocalAuthApi()));
}

class _LoginViewState extends State<LoginView> {
  final AuthUseCase _authUseCase;

  _LoginViewState(this._authUseCase);

  bool _vPass = true;

  void _viewPass(bool vPass) {
    _vPass = !vPass;
  }

  Future<void> _onSubmit() async {
    try {
      ProgressDialog.show(context);
      final result = await _authUseCase.onSubmit();
      ProgressDialog.dissmiss(context);
      if (result == 1) {
        return popAllAndPush(context, HomeView());
      }
      if (result == 0) {
        return showDialogMessage(
            context, 'Información', 'Error de usuario y/o contraseña.');
      }
      if (result == 2) {
        return showDialogMessage(
            context, 'Información', 'Ingrese usuario y/o contraseña.');
      }
    } on AppException catch (ex) {
      print(ex);
      return showDialogMessage(
          context, 'Información', 'Servidor sin respuesta.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
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
                                        usuarioController:
                                            _authUseCase.usernameController,
                                        onChangedUserName:
                                            _authUseCase.changedUserName,
                                      ),
                                      TextFieldPassword(
                                        passwordController:
                                            _authUseCase.passwordController,
                                        secureText: true,
                                        onPressedIcon: () {
                                          _viewPass(_vPass);
                                        },
                                        onChangedPasssword:
                                            _authUseCase.changedPassword,
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
                                          value: true, onSubmit: _onSubmit),
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
        },
      ),
    );
  }
}
