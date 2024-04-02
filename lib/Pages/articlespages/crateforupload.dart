// ignore_for_file: use_build_context_synchronously, avoid_print, unused_local_variable

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

import '../Upload/database.dart';
import 'articleupload.dart';

class UploadTask extends StatefulWidget {
  const UploadTask({super.key});

  @override
  State<UploadTask> createState() => _FirstPageWhenItLogState();
}

class _FirstPageWhenItLogState extends State<UploadTask> {
  TextEditingController topic = TextEditingController();
  TextEditingController description = TextEditingController();
  String imageurl = '';
  String image = '';

  functionstarting() async {
    artical = await DatabaseMethode().getArtical();
    setState(() {});
  }

  Stream? artical;
  Widget allarticals() {
    return StreamBuilder(
        stream: artical,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      margin: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Material(
                        elevation: 5.0,
                        child: ListTile(
                          shape: CircleBorder(side: BorderSide(style: BorderStyle.none)),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ArticlaPage(
                                      topic: ds['topic'],
                                      image: ds['image'],
                                      description: ds['description'],
                                    )));
                          },
                          title: Text(ds['topic'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          hoverColor: Colors.brown,
                          focusColor: const Color.fromARGB(255, 169, 241, 241),
                          style: ListTileStyle.list,
                          splashColor: const Color.fromARGB(255, 140, 199, 233),
                          trailing: GestureDetector(
                              onTap: () async {
                                await DatabaseMethode().deleteartical(ds['id']);
                              },
                              child:const SizedBox(
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                ),
                              )),
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  void dispose() {
    super.dispose();
    topic.clear();
    description.clear();
  }

  String user = FirebaseAuth.instance.currentUser!.email.toString();

  Future singnoutprocess() async {
    await FirebaseAuth.instance.signOut();
  }

  Future pickimagefromgallery() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? returnIamge =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (returnIamge == null) return null;
    String filename = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDicimage = referenceRoot.child('image');
    Reference referenceimageuploade = referenceDicimage.child(topic.toString());
    try {
      await referenceimageuploade.putFile(File(returnIamge.path));
      imageurl = await referenceimageuploade.getDownloadURL();
    } catch (e) {
      print(e);
    }

    Navigator.of(context).pop();
  }

  Future pickimagefromcamera() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? returnIamge =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (returnIamge == null) return null;
    String filename = DateTime.now().microsecondsSinceEpoch.toString();

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDicimage = referenceRoot.child('image');
    Reference referenceimageuploade = referenceDicimage.child(topic.toString());
    try {
      await referenceimageuploade.putFile(File(returnIamge.path));
      imageurl = await referenceimageuploade.getDownloadURL();
    } catch (e) {
      print(e);
    }

    Navigator.of(context).pop();
  }

  void functiontoaddimage(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 4.5,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      pickimagefromgallery();
                    },
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            size: 70,
                          ),
                          Text('Gallery')
                        ]),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      pickimagefromcamera();
                    },
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 70,
                          ),
                          Text('camera')
                        ]),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future<void> _create() async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 53,
                  color: const Color.fromARGB(255, 241, 238, 241),
                  child: TextFormField(
                    controller: topic,
                    decoration: const InputDecoration(
                        hintText: "Enter a Topic",
                        border: OutlineInputBorder()),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  onTap: () {
                    functiontoaddimage(context);
                  },
                  child: Container(
                    height: 35,
                    width: 110,
                    color: Colors.black,
                    child: const Row(children: [
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Image',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )
                    ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  color: const Color.fromARGB(255, 241, 238, 241),
                  child: TextFormField(
                    controller: description,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: "Description",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () async {
                        if (imageurl.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please Enter a image')));
                          return;
                        }
                        String id = randomAlphaNumeric(10);
                        Map<String, dynamic> articleslist = {
                          "topic": topic.text,
                          "useremail": user,
                          "image": imageurl,
                          "id": id,
                          "description": description.text
                        };
                        await DatabaseMethode()
                            .articalcontents(articleslist, id);
                        topic.text = '';
                        description.text = '';
                        Navigator.of(context).pop();
                      },
                      child: const Text('Save')),
                ],
              ),
            ]),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    functionstarting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 246, 248, 248),
        elevation: 0,
      ),
      drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 216, 230, 241),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(255, 157, 178, 194),
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
                        backgroundColor:
                            const Color.fromARGB(255, 193, 222, 245),
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
      body: Column(
        children: [
          Expanded(child: allarticals()),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 246, 248, 248),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _create();
          },
          child: const Icon(
            Icons.add,
            color: Color.fromARGB(255, 226, 30, 30),
          )),
    );
  }
}
// StreamBuilder(
//           stream: artical,
//           builder: (context, AsyncSnapshot snapshot) {
//             return snapshot.hasData
//                 ? ListView.builder(
//                     itemCount: snapshot.data.docs.length,
//                     itemBuilder: (context, index) {
//                       DocumentSnapshot ds = snapshot.data.docs.length;

//                       return ListTile(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => ArticlaPage(
//                                     topic: ds['topic'],
//                                     image: ds['image'],
//                                     description: ds['description'],
                                  // )));
//                         },
//                         title: Text(ds['topic'],
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 20)),
//                         hoverColor: Colors.brown,
//                         focusColor: const Color.fromARGB(255, 169, 241, 241),
//                         style: ListTileStyle.list,
//                         splashColor: const Color.fromARGB(255, 140, 199, 233),
//                         trailing: GestureDetector(
//                             onTap: () async {
                              // await DatabaseMethode().deleteartical(ds['id']);
//                             },
//                             child: const Icon(
//                               Icons.delete,
//                               color: Colors.black,
//                             )),
//                       );
//                     },
//                   )
//                 : Container();
//           }),