import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class MarksMethod {
  static Future getMarks(int clasS) async {
    List<Map<String, dynamic>> studentList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("Users")
        .where("userType", isEqualTo: "student")
        .where('class', isEqualTo: clasS)
        .get();
    await Future.forEach(querySnapshot.docs, (doc) {
      studentList
          .add({'uid': doc['uid'], 'name': doc['name'], 'marks': doc['marks']});
    });
    print(studentList.length);
    return studentList;
  }

  static void updateMarks(
      {String uid, String examType, marks}) {
    FirebaseFirestore.instance.collection("Users").doc(uid).update({
      'marks.$examType': marks,
    });
  }
}
