import 'package:cloud_firestore/cloud_firestore.dart';

class UploadAttendanceMethods {
  static Future getAttendance(int clasS) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("Users")
        .where("userType", isEqualTo: "student")
        .where("class", isEqualTo: clasS)
        .get();
    List<Map<String, dynamic>> studentsList = [];
    DateTime dateTime = DateTime.now();
    String day = dateTime.day.toString().padLeft(2, "0");
    String month = dateTime.month.toString().padLeft(2, "0");
    String year = dateTime.year.toString();
    String date = day + "-" + month + "-" + year;
    print(date);
    await Future.forEach(querySnapshot.docs, (DocumentSnapshot doc) async {
      if (doc.data().containsKey('attendance')) {
        var attendance = doc['attendance'];
        if (attendance.containsKey(date)) {
          studentsList.add({
            'id': doc['uid'],
            'name': doc['name'],
            'absent': attendance[date],
          });
        } else {
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(doc['uid'])
              .update(
            {
              'attendance.$date': false,
            },
          );
          studentsList.add({
            'id': doc['uid'],
            'name': doc['name'],
            'absent': false,
          });
        }
      } else {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(doc['uid'])
            .set(
                {
              'attendance': {
                date: false,
              },
            },
                SetOptions(
                  merge: true,
                ));
        studentsList.add({
          'id': doc['uid'],
          'name': doc['name'],
          'absent': false,
        });
      }
    });
    return studentsList;
  }

  static changeAttendance(String uid, bool value) {
    print(uid);
    DateTime dateTime = DateTime.now();
    String day = dateTime.day.toString().padLeft(2, "0");
    String month = dateTime.month.toString().padLeft(2, "0");
    String year = dateTime.year.toString();
    String date = day + "-" + month + "-" + year;
    FirebaseFirestore.instance.collection("Users").doc(uid).update({
      'attendance.$date': value,
    });
  }

  static Future getPreviousAttendance(int clasS) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("Users")
        .where("userType", isEqualTo: "student")
        .where("class", isEqualTo: clasS)
        .get();
    List<Map<String, dynamic>> studentList = [];
    await Future.forEach(querySnapshot.docs, (doc) {
      studentList.add(
        {
          'id': doc['uid'],
          'name': doc['name'],
          'attendance': doc['attendance'],
        },
      );
    });
    return studentList;
  }
}
