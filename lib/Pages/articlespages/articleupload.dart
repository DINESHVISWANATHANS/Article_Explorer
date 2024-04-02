// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ArticlaPage extends StatelessWidget {
  String? topic;
  String? image;
  String? description;
  ArticlaPage(
      {super.key,
      required this.topic,
      required this.image,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 218, 236, 245),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$topic  ",
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 73, 104, 119)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 350,
                  width: MediaQuery.sizeOf(context).width,
                  color: const Color.fromARGB(255, 88, 192, 218),
                  child: Image.network(
                    '$image',
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 20,
              ),
              Text(
                "  $description",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
