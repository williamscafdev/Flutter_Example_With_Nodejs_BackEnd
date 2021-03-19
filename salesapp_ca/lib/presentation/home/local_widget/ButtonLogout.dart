import 'package:flutter/material.dart';

class ButtonLogout extends StatelessWidget {
  const ButtonLogout({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);
  final Function() onSubmit;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSubmit,
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.orange[900]),
        child: Center(
          child: Text(
            'Cerrar Session',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
