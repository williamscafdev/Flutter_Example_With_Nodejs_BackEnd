import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salesapp_ca/presentation/login/login_view.dart';
import 'package:salesapp_ca/utils/navigator_utils.dart';

import 'cubit/home_cubit.dart';
import 'local_widget/AppBarPersonalize.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => HomeCubitLogout(context.read()),
        child: BlocConsumer<HomeCubitLogout, HomeState>(
          listener: (context, snapshot) {
            switch (snapshot) {
              case HomeState.logout:
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext _) {
                    return AlertDialog(
                      title: Text('Información'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('Desea cerrar sesión.'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                            child: Text('Si'),
                            onPressed: () {
                              context.read<HomeCubitLogout>().sessionClose();
                              popAllAndPush(context, LoginView());
                            }),
                        TextButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
                break;
              case HomeState.none:
                break;
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size(size.width, 40),
                child: AppBarPersonalize(
                  onlogout: context.read<HomeCubitLogout>().onLogout,
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
          },
        ));
  }
}
