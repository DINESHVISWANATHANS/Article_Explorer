// ignore_for_file: use_build_context_synchronously, unused_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/inputtexbutton.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController email = TextEditingController();
  Future passwordreset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: SizedBox(
                height: 70,
                width: 50,
                child: Column(
                  children: [
                    const Text('Password reset link sent! check your email'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () {}, child: const Text('ok'))
                      ],
                    )
                  ],
                ),
              ),
            );
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: SizedBox(
                height: 70,
                width: 50,
                child: Column(
                  children: [
                    const Text('This email is Invalide'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () {}, child: const Text('ok'))
                      ],
                    )
                  ],
                ),
              ),
            );
          });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Enter a E-mail and Reset a Password",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 30,
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
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: passwordreset, child: const Text('Reset Password'))
          ]),
    );
  }
}
