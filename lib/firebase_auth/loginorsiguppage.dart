import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'visitorandpublisher.dart';

class Loginorreg extends StatefulWidget {
  const Loginorreg({super.key});

  @override
  State<Loginorreg> createState() => _LoginorregState();
}

class _LoginorregState extends State<Loginorreg> {
  bool shownextpage = true;
  void function() {
    setState(() {
      shownextpage = !shownextpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (shownextpage) {
      return LoginPage(
        shownextpage: function,
      );
    } else {
      return VisitorAndPublisher(
        shownextpage: function,
      );
    }
  }
}
