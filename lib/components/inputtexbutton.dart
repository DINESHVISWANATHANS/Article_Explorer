// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class InputTextButton extends StatelessWidget {
  final controller;
  final hinttext;
  bool obscureText;
  String? Function(String?)? validator;
  InputTextButton(
      {super.key,
      required this.controller,
      required this.hinttext,
      required this.validator,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            hintText: "   $hinttext",
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 90),
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
