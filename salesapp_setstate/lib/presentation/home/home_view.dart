import 'package:flutter/material.dart';
import 'package:salesapp_setstate/data/services/local/local_auth_api.dart';
import 'package:salesapp_setstate/data/services/remote/authentication_api.dart';
import 'package:salesapp_setstate/domain/usercase/auth_usecase.dart';
import 'package:salesapp_setstate/presentation/widgets/ShowDialogMessageWithFunc.dart';

import 'local_widget/AppBarPersonalize.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() =>
      _HomeViewState(AuthUseCase(AuthenticationApi(), LocalAuthApi()));
}

class _HomeViewState extends State<HomeView> {
  final AuthUseCase _authUseCase;

  _HomeViewState(this._authUseCase);
  _onLogout() {
    showDialogMessageWithFunc(
        context, 'Información', 'Desea cerrar sesión.', _authUseCase.onLogout);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, 40),
        child: AppBarPersonalize(
          onlogout: () => _onLogout(),
          value: 1,
          title: 'HomePage',
          valor: 1,
        ),
      ),
      drawer: Drawer(
        elevation: 16.0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
