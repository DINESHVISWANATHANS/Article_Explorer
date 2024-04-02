// ignore_for_file: unused_import

import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import '../components/inputtexbutton.dart';
import '../components/signinbutton.dart';
import "ForgetPasswordPage.dart";

class LoginPage extends StatefulWidget {
  final VoidCallback shownextpage;
  const LoginPage({super.key, required this.shownextpage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future signinprocess() async {
    _formkey.currentState!.validate();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
    } on FirebaseAuthException {
      return null;
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Form(
            key: _formkey,
            child: Container(
              height: 472,
              width: 350,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(134, 163, 160, 160),
                        offset: Offset(3.0, 3.0),
                        spreadRadius: 1,
                        blurRadius: 10)
                  ]),
              child: Column(children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 85, 79, 79)),
                ),
                const SizedBox(
                  height: 20,
                ),
                InputTextButton(
                    controller: email,
                    hinttext: "E-mail",
                    obscureText: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter email";
                      } else if (!value.contains("@gmail.com")) {
                        return "Please enter valid email";
                      } else {
                        return "";
                      }
                    }),
                InputTextButton(
                  controller: password,
                  obscureText: true,
                  hinttext: "Password",
                  validator: (value) {
                    if (value!.length < 8) {
                      return "weak password";
                    } else {
                      return " ";
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgetPasswordPage()));
                      },
                      child: const Text('Forget Password?'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SigninbuttonOrSignUpButton(
                  onTap: signinprocess,
                  name: "Sign in",
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'If you did\'n have a account?',
                    ),
                    TextButton(
                        onPressed: widget.shownextpage,
                        child: const Text('Sign up')),
                  ],
                )
              ]),
            ),
          ),
        )
      ]),
    );
  }
}
