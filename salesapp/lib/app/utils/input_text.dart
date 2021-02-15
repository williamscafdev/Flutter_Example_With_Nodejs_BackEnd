import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final bool oscureText;
  final Icon icon;
  const InputText(
      {Key key,
      this.label = '',
      this.keyboardType,
      this.oscureText = false,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: this.keyboardType,
      obscureText: oscureText,
      decoration: InputDecoration(
          suffixIcon: icon,
          labelText: this.label,
          labelStyle: TextStyle(
            color: Colors.black45,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
