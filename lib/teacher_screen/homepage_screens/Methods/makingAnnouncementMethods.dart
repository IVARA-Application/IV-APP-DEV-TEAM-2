import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class MakingAnnouncementMethods {
  void makeAnnouncement(
      {String clasS, String section, String content, String subject,DateTime dateTime}) {
  
    String day = dateTime.day.toString().padLeft(2, "0");
    String month = dateTime.month.toString().padLeft(2, "0");
    String year = dateTime.year.toString();
    String date = day + "-" + month + "-" + year;

    String hour = dateTime.hour.toString().padLeft(2, "0");
    String minute = dateTime.minute.toString().padLeft(2, "0");
    String ampm = dateTime.hour <= 11 ? "AM" : "PM";
    String currentTime = hour + ":" + minute + " " + ampm;
    print(currentTime);
    FirebaseFirestore.instance
        .collection("Notification")
        .doc("School Name")
        .collection("Class $clasS")
        .doc("Section $section")
        .set(
      {
        date: FieldValue.arrayUnion(
          [
            {
              'content': content,
              'subject': subject,
              'time': currentTime,
              'timestamp':dateTime.microsecondsSinceEpoch
            }
          ],
        ),
      },
      SetOptions(merge: true),
    );
  }
}
