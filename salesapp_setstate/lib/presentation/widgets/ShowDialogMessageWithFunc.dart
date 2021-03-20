import 'package:flutter/material.dart';
import 'package:salesapp_setstate/presentation/login/login_view.dart';
import 'package:salesapp_setstate/utils/navigator_utils.dart';

void showDialogMessageWithFunc(
    BuildContext context, String title, String message, void Function() funct) {
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
                funct();
                pushAndReplaceToPage(context, LoginView());
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
