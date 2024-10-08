import 'package:flutter/material.dart';

import '../../../constants.dart';
class textfield extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;

  const textfield({
    super.key, required this.icon, required this.obscureText, required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style:TextStyle(
        color: Constants.blackColor,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(icon,color: Constants.blackColor.withOpacity(.4),),
        hintText: hintText,
      ),
      cursorColor: Constants.blackColor.withOpacity(.5),
    );
  }
}