// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SigninbuttonOrSignUpButton extends StatelessWidget {
  void Function()? onTap;
  final name;
  SigninbuttonOrSignUpButton(
      {super.key, required this.onTap, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 230,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(45),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(133, 41, 39, 39),
                  offset: Offset(5.0, 5.0),
                  spreadRadius: 5,
                  blurRadius: 20)
            ]),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
