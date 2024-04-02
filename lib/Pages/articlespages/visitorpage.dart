import 'package:article_explorer/Pages/articlespages/articleupload.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VisitorPageForm extends StatefulWidget {
  const VisitorPageForm({super.key});

  @override
  State<VisitorPageForm> createState() => _VisitorPageFormState();
}

class _VisitorPageFormState extends State<VisitorPageForm> {
  singnoutprocess() async {
    await FirebaseAuth.instance.signOut();
  }

  String user = FirebaseAuth.instance.currentUser!.email.toString();

  late Stream<QuerySnapshot> _stream;
  @override
  void initState() {
    super.initState();

    _stream =
        FirebaseFirestore.instance.collection('Artical content').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 218, 236, 245),
        elevation: 0,
      ),
      drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 218, 236, 245),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(20),
                  boxShadow:const [
                     BoxShadow(
                    color:  Color.fromARGB(255, 157, 178, 194),
                      blurRadius: 15,
                      spreadRadius: 1.0,
                    offset: Offset(4, 4))
                  ],
                ),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 193, 222, 245),
                        child: Text(user[0]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        user,
                        style: const TextStyle(
                            fontSize: 20, color: Color.fromARGB(255, 7, 8, 8)),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                    onPressed: singnoutprocess, child: const Text('LogOut')),
              )
            ],
          )),
      backgroundColor: const Color.fromARGB(255, 218, 236, 245),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            QuerySnapshot querySnapshot = snap.data;
            List<QueryDocumentSnapshot> document = querySnapshot.docs;
            List<Map> items = document.map((e) => e.data() as Map).toList();
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int indext) {
                  Map thisitem = items[indext];
                  return Card(
                    color: const Color.fromARGB(255, 163, 192, 206),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ArticlaPage(
                                  topic: thisitem['topic'],
                                  image: thisitem['image'],
                                  description: thisitem['description'],
                                )));
                      },
                      title: Text(thisitem['topic'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      hoverColor: Colors.brown,
                      focusColor: const Color.fromARGB(255, 169, 241, 241),
                      style: ListTileStyle.list,
                      splashColor: const Color.fromARGB(255, 140, 199, 233),
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
