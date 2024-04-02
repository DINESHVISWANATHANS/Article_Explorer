import 'package:article_explorer/Pages/articlespages/crateforupload.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'articlespages/visitorpage.dart';

class Userispuborvist extends StatefulWidget {
  const Userispuborvist({super.key});

  @override
  State<Userispuborvist> createState() => _UserispuborvistState();
}

class _UserispuborvistState extends State<Userispuborvist> {
  User emailtype = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    if (emailtype.email!.contains("@publisher.com")) {
      return const UploadTask();
      // return FirstPageWhenItLog();
    } else {
      return const  VisitorPageForm();
    }
  }
}
