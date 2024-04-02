
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethode {
  Future articalcontents(Map<String, dynamic> articleslist, String id) async {
    return await FirebaseFirestore.instance
        .collection("Artical content")
        .doc(id)
        .set(articleslist);
  }
  Future<Stream<QuerySnapshot>> getArtical()async{
    return await FirebaseFirestore.instance.collection("Artical content").snapshots();
  }

  Future updateartical(String id,Map<String,dynamic>data)async{
    return await FirebaseFirestore.instance.collection(
      "Artical content"
    ).doc(id).update(data);
  }
  Future deleteartical(String id)async{
    return await FirebaseFirestore.instance.collection(
      "Artical content"
    ).doc(id).delete();
  }

  // Future articalimage(File? image, String id, String topic) async {
  //   final path = 'Artical Image/$topic';
  //   Reference referenceroot = FirebaseStorage.instance.ref();
  //   Reference referenceDirimage = referenceroot.child('image');
  //   Reference referenceImageuploade = referenceDirimage.child(topic);
  //   try {
  //     await referenceImageuploade.putFile(File(path));
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
  //   final path = 'Artical Image/$Topic';
  //   Reference referenceroot = FirebaseStorage.instance.ref();
  //   Reference referenceDirimage = referenceroot.child('image');
  //   Reference referenceImageuploade = referenceDirimage.child(Topic.toString());
  //   try {
  //     await referenceImageuploade.putFile(File(returnIamge.path));
  //   } catch (e) {
  //     print(e);
  //   }
  // }