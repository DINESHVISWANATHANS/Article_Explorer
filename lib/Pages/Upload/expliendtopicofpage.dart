import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ExpliendTopicInThisPage extends StatefulWidget {
  const ExpliendTopicInThisPage({super.key});

  @override
  State<ExpliendTopicInThisPage> createState() =>
      _ExpliendTopicInThisPageState();
}

class _ExpliendTopicInThisPageState extends State<ExpliendTopicInThisPage> {
  Future getusername(String topic,String description) async {
    await FirebaseFirestore.instance.collection('user').add({'topic':'hhvjhvnk',
    'description':' asvsvsvsvsvsvsv'
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [],
    );
  }
}
