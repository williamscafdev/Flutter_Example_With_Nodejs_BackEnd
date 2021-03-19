import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesapp_ca/domain/usercase/auth_usecase.dart';
import 'package:salesapp_ca/presentation/home/home_view.dart';
import 'package:salesapp_ca/presentation/widgets/ProgressIndicator.dart';
import 'package:salesapp_ca/presentation/widgets/ShowDialogMessage.dart';
import 'package:salesapp_ca/utils/colors_constants.dart';
import 'package:salesapp_ca/utils/navigator_utils.dart';

import 'cubit/loginPass_cubit.dart';
import 'cubit/login_cubit.dart';
import 'local_widget/ButtonLogin.dart';
import 'local_widget/CurvePainter.dart';
import 'local_widget/TextFieldPassword.dart';
import 'local_widget/TextFieldUserName.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(context.read())),
        BlocProvider(
          create: (_) => LoginCubitPass(),
        ),
      ],
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, snapshot) {
          switch (snapshot) {
            case LoginState.loading:
              meesagIndicator(context);
              break;
            case LoginState.none:
              Navigator.of(context).pop();
              break;
            case LoginState.userError:
              showDialogMessage(
                  context, 'Información', 'Error de usuario y/o contraseña.');
              break;
            case LoginState.existing_user:
              pushAndReplaceToPage(context, HomeView());
              break;
            case LoginState.typing:
              showDialogMessage(context, 'Información',
                  'Debe ingresar usuario y contraseña.');
              break;
            case LoginState.error:
              showDialogMessage(
                  context, 'Información', 'Servidor sin respuesta.');
              break;
          }
        },
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.topCenter, colors: [
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
                                  style:
                                      TextStyle(color: blackv2, fontSize: 40)),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Bienvenidos',
                                  style:
                                      TextStyle(color: blackv2, fontSize: 20))
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                              usuarioController: context
                                                  .read<AuthUseCase>()
                                                  .usernameController,
                                              onChangedUserName: context
                                                  .read<AuthUseCase>()
                                                  .changedUserName,
                                            ),
                                            BlocBuilder<LoginCubitPass, bool>(
                                              builder: (contxt, snapshot) {
                                                return TextFieldPassword(
                                                  passwordController: context
                                                      .read<AuthUseCase>()
                                                      .passwordController,
                                                  secureText: snapshot,
                                                  onPressedIcon: contxt
                                                      .read<LoginCubitPass>()
                                                      .viewPass,
                                                  onChangedPasssword: context
                                                      .read<AuthUseCase>()
                                                      .changedPassword,
                                                );
                                              },
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
                                              onSubmit: context
                                                  .read<LoginCubit>()
                                                  .onSubmit,
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
        },
      ),
    );
  }
}
