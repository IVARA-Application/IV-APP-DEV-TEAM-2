import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceMethods {
  static int clasS;
  static Future getAttendanceOfStudent(String uid) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection("Users").doc(uid).get();
    Map attendance = doc['attendance'];
    clasS = doc['class'];

    return attendance;
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

  static Future getTimeTable() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("TimeTable")
        .doc("School Name")
        .collection("Class $clasS")
        .doc("Section A")
        .get();
    Map timeTable = {
      'Mon': doc['monday'],
      'Tue': doc['tuesday'],
      'Wed': doc['wednesday'],
      'Thu': doc['thursday'],
      'Fri': doc['friday'],
      'Sat': doc['saturday'],
      'Sun': []
    };

    return timeTable;
  }

  static setTimeTable() async {
    FirebaseFirestore.instance
        .collection("TimeTable")
        .doc("School Name")
        .collection("Class 7")
        .doc("Section A")
        .set({
      'monday': [
        {
          'subjectName': 'Physics',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '09:00 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Chemistry',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Maths',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Computer',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        }
      ],
      'tuesday': [
        {
          'subjectName': 'Maths',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '09:00 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Chemistry',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Physics',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Computer',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        }
      ],
      'wednesday': [
        {
          'subjectName': 'Chemistry',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '09:00 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Physics',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Maths',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Computer',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        }
      ],
      'thursday': [
        {
          'subjectName': 'Computer',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '09:00 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Chemistry',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Maths',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Physics',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        }
      ],
      'friday': [
        {
          'subjectName': 'Chemistry',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '09:00 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Physics',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Computer',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Maths',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        }
      ],
      'saturday': [
        {
          'subjectName': 'Physics',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '09:00 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Chemistry',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Maths',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        },
        {
          'subjectName': 'Computer',
          'teacherName': 'Teacher Name',
          'id': 'IVID',
          'classNo': 'Class Number',
          'time': '10:40 AM',
          'duration': '01:30 hrs',
        }
      ],
    });
  }
}
