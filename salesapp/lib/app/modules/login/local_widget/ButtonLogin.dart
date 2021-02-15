import 'package:flutter/material.dart';
import 'package:salesapp/app/utils/fade_animation.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    Key key,
    @required this.onSubmit,
  }) : super(key: key);
  final Function() onSubmit;
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      1.8,
      GestureDetector(
        onTap: onSubmit,
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.orange[900]),
          child: Center(
            child: Text(
              'Ingresar',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
