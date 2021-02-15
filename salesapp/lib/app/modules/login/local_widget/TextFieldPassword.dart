import 'package:flutter/material.dart';
import 'package:salesapp/app/utils/fade_animation.dart';

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword({
    Key key,
    @required this.onChangedPasssword,
  }) : super(key: key);
  final Function(String) onChangedPasssword;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1.5,
      Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[200]))),
        child: TextField(
          onChanged: onChangedPasssword,
          decoration: InputDecoration(
              hintText: 'Contraseña',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
