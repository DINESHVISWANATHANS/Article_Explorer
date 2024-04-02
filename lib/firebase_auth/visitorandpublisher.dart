import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/inputtexbutton.dart';
import '../components/signinbutton.dart';

class VisitorAndPublisher extends StatefulWidget {
  final VoidCallback shownextpage;

  const VisitorAndPublisher({super.key, required this.shownextpage});

  @override
  State<VisitorAndPublisher> createState() => _VisitorAndPublisherState();
}

class _VisitorAndPublisherState extends State<VisitorAndPublisher> {
  final _formkeypass = GlobalKey<FormState>();
  final _formkeyvist = GlobalKey<FormState>();

  TextEditingController emailvist = TextEditingController();
  TextEditingController passwordvist = TextEditingController();
  TextEditingController conformpasswordvist = TextEditingController();
  TextEditingController usernamevist = TextEditingController();
  Future signupprocessvist() async {
    _formkeyvist.currentState!.validate();

    if (truemeanvist()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailvist.text.trim(), password: passwordvist.text.trim());
    }
  }

  bool truemeanvist() {
    if (conformpasswordvist.text.trim() == passwordvist.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  TextEditingController emailpass = TextEditingController();
  TextEditingController passwordpass = TextEditingController();
  TextEditingController conformpasswordpass = TextEditingController();
  TextEditingController usernamepass = TextEditingController();
  TextEditingController pincode = TextEditingController();
  int pin = 972003;
  Future signupprocesspass() async {
    _formkeypass.currentState!.validate();

    if (truemean()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailpass.text.trim(), password: passwordpass.text.trim());
    }

  }


  Future signupmethod() async {
    if (pin.toString() == pincode.toString()) {
      return signupprocesspass;
    } else {
      return null;
    }
  }

  bool truemean() {
    if (conformpasswordpass.text.trim() == passwordpass.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    emailpass.dispose();
    passwordpass.dispose();
    emailvist.dispose();
    passwordvist.dispose();
    super.dispose();
  }

  bool pagesift = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pagesift = true;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: pagesift
                            ? const Color.fromARGB(134, 163, 160, 160)
                            : Colors.black,
                        borderRadius: BorderRadius.circular(45),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(133, 41, 39, 39),
                              offset: Offset(5.0, 5.0),
                              spreadRadius: 5,
                              blurRadius: 20)
                        ]),
                    child: const Center(
                      child: Text(
                        'Visitor',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pagesift = false;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: pagesift
                            ? Colors.black
                            : const Color.fromARGB(134, 163, 160, 160),
                        borderRadius: BorderRadius.circular(45),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(133, 41, 39, 39),
                              offset: Offset(5.0, 5.0),
                              spreadRadius: 5,
                              blurRadius: 20)
                        ]),
                    child: const Center(
                      child: Text(
                        'Publisher',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            pagesift
                ? Form(
                    key: _formkeyvist,
                    child: Container(
                      height: 820,
                      width: 400,
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
                          height: 40,
                        ),
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 85, 79, 79)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InputTextButton(
                            controller: usernamevist,
                            hinttext: "User Name",
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter a name";
                              } else {
                                return "";
                              }
                            },
                            obscureText: false),
                        InputTextButton(
                            controller: emailvist,
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
                          controller: passwordvist,
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
                        InputTextButton(
                          controller: conformpasswordvist,
                          obscureText: true,
                          hinttext: "Conform Password",
                          validator: (value) {
                            if (value!.length < 8) {
                              return "weak password";
                            } else {
                              return " ";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SigninbuttonOrSignUpButton(
                          onTap: signupprocessvist,
                          name: "Sign Up",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'If you have an account?',
                            ),
                            TextButton(
                                onPressed: widget.shownextpage,
                                child: const Text('Login')),
                          ],
                        )
                      ]),
                    ),
                  )
                : Form(
                    key: _formkeypass,
                    child: Container(
                      height: 820,
                      width: 400,
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
                          height: 40,
                        ),
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 85, 79, 79)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: pincode,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty &&
                                  value.length == 6 &&
                                  !value.contains(pin.toString())) {
                                return "Enter a Code";
                              } else {
                                return " ";
                              }
                            },
                            decoration: InputDecoration(
                                hintText: " Enter a code",
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 90),
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InputTextButton(
                            controller: usernamepass,
                            hinttext: "Pubilsher Name",
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter a name";
                              } else {
                                return "";
                              }
                            },
                            obscureText: false),
                        InputTextButton(
                            controller: emailpass,
                            hinttext: "E-mail",
                            obscureText: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter email";
                              } else if (!value.contains("@publisher.com")) {
                                return "Please enter valid email";
                              } else {
                                return "";
                              }
                            }),
                        InputTextButton(
                          controller: passwordpass,
                          obscureText: true,
                          hinttext: "Password",
                          validator: (value) {
                            if (value!.length <= 8) {
                              return "weak password";
                            } else {
                              return " ";
                            }
                          },
                        ),
                        InputTextButton(
                          controller: conformpasswordpass,
                          obscureText: true,
                          hinttext: "Conform Password",
                          validator: (value) {
                            if (value!.length <= 8) {
                              return "weak password";
                            } else {
                              return " ";
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SigninbuttonOrSignUpButton(
                          onTap: signupprocesspass,
                          name: "Sign Up",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'If you have an account?',
                            ),
                            TextButton(
                                onPressed: widget.shownextpage,
                                child: const Text('Login')),
                          ],
                        )
                      ]),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
