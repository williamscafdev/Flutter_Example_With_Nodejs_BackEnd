import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salesapp_cariverpod/presentation/login/login_view.dart';
import 'package:salesapp_cariverpod/presentation/provider_Riverpod/providers.dart';
import 'package:salesapp_cariverpod/utils/navigator_utils.dart';

//import 'controller/home_controller.dart';
import 'controller/home_controller.dart';
import 'local_widget/AppBarPersonalize.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homestate = context.read(homestateControllerNotifierProvider);
    int i = 0;
    print('build');
    var size = MediaQuery.of(context).size;
    return ProviderListener<StateController<HomeState>>(
      provider: homestateControllerNotifierProvider,
      onChange: (context, home) {
        print(i++);
        if (home.state == HomeState.logout) {
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
                        context
                            .read(homeControllerNotifierProvider)
                            .sessionClose();
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
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(size.width, 40),
          child: AppBarPersonalize(
            onlogout: () {
              homestate.state = HomeState.logout;
            },
            value: 1,
            title: 'Home View',
            valor: 1,
          ),
        ),
        drawer: Drawer(
          elevation: 16.0,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}
