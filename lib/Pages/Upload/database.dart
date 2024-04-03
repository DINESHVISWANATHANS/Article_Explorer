
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethode {
  Future articalcontents(Map<String, dynamic> articleslist, String id) async {
    return await FirebaseFirestore.instance
        .collection("Artical content")
        .doc(id)
        .set(articleslist);
  }
  Future<Stream<QuerySnapshot>> getArtical(String userEmail)async{
  return FirebaseFirestore.instance
      .collection('Artical content')
      .where('useremail', isEqualTo: userEmail) // Assuming 'useremail' is the field storing user's email
      .snapshots();
}

   


  Future updateartical(String id,Map<String,dynamic>data)async{
    return await FirebaseFirestore.instance.collection(
      "Artical content"
    ).doc(id).update(data);
  }
  Future deleteartical(String id)async{
        try {
      await FirebaseFirestore.instance
          .collection('Artical content')
          .doc(id)
          .delete();
      print('Article deleted successfully');
    } catch (e) {
      print('Error deleting article: $e');
    }
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
