import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

pushToPage(BuildContext context, Widget widget) async {
  await Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => widget),
  );
}

pushAndReplaceToPage(BuildContext context, Widget widget) async {
  await Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => widget),
  );
}

popAllAndPush(BuildContext context, Widget widget) async {
  await Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (BuildContext context) => widget),
    ModalRoute.withName('/'),
  );
}
