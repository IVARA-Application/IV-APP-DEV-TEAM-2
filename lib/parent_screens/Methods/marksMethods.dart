import 'package:cloud_firestore/cloud_firestore.dart';

class MarksMethods {
  static Future getMarksOfStudent(String studentUid) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("Users")
        .doc(studentUid)
        .get();
    Map marksMap=doc['marks'];
    return marksMap;
  }

  static Future checkForStudent(String parentUid) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("Users")
        .doc(parentUid)
        .get();
    if (doc.data().containsKey('yourChildId')) {
      String studentId = doc.data()['yourChildId'];
      return studentId;
    } else {
      return null;
    }
  }
}
