import 'package:flutter/material.dart';

class TextFieldPassword extends StatelessWidget {
  const TextFieldPassword(
      {Key? key,
      required this.onChangedPasssword,
      required this.passwordController,
      required this.onPressedIcon,
      required this.secureText})
      : super(key: key);
  final Function(String) onChangedPasssword;
  final bool secureText;
  final TextEditingController passwordController;
  final Function() onPressedIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[200]!))),
      child: TextFormField(
        controller: passwordController,
        onChanged: onChangedPasssword,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(secureText ? Icons.remove_red_eye : Icons.security),
            onPressed: onPressedIcon,
          ),
        ),
        obscureText: secureText,
      ),
    );
  }
}
