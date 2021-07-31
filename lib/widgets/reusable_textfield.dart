import 'package:flutter/material.dart';
import 'package:yolo/core/data/constants/app_constants.dart';

class ReusableTextField extends StatelessWidget {
  final Function onPressedCallback;
  final bool isObsecureText;
  final String hintText;
  final IconData suffixIcon;
  final TextEditingController controller;

  ReusableTextField({
    required this.onPressedCallback,
    required this.suffixIcon,
    required this.hintText,
    required this.isObsecureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newValue) {
        onPressedCallback(newValue);
      },
      obscureText: isObsecureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
          (Radius.circular(10.0)),
        )),
        suffixIcon: Icon(
          suffixIcon,
          size: 40.0,
          color: secondaryColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
      ),
      controller: controller,
    );
  }
}
