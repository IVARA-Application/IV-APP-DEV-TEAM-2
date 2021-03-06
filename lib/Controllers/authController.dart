import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:new_ivara_app/Controllers/notificationController.dart';
import 'package:new_ivara_app/parent_screens/parents_home_screen.dart';
import 'package:new_ivara_app/screens/user_type.dart';
import 'package:new_ivara_app/student_screens/student_homepage/studentHomepage.dart';
import 'package:new_ivara_app/teacher_screen/teacher_homepage.dart';

class AuthController extends GetxController {
  RxBool isSignedIn = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  Rx<User> user;
  String userType = "";
  String name = "";
  String phoneNumber = "";
  String clasS = "7";
  String section = "A";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkUserSignedInOrNot();
  }

  void checkUserSignedInOrNot() async {
    FirebaseAuth.instance.authStateChanges().listen(
      (User user1) async {
        if (user1 == null) {
          print('User is currently signed out!');
        } else {
          user = user1.obs;
          print(user.value.email);
          String messagingToken =
              await Get.find<NotificationController>().messaging.getToken();
          DocumentSnapshot userDoc = await FirebaseFirestore.instance
              .collection("Users")
              .doc(user.value.uid)
              .get();
          FirebaseFirestore.instance
              .collection("Users")
              .doc(user.value.uid)
              .set(
                  {'token': messagingToken},
                  SetOptions(
                    merge: true,
                  ));
          userType = userDoc.data()['userType'];
          name = userDoc.data()['name'];
          phoneNumber = userDoc.data()['phoneNumber'];
          print("User is signed in");
          if (userType == "student") {
            Get.offAll(() => StudentHomePage(0));
          } else if (userType == "teacher") {
            Get.offAll(() => TeacherHomepage());
          } else if (userType == 'parent') {
            Get.offAll(() => ParentsHomeScreen());
          }

          isSignedIn = true.obs;
        }
      },
    );
  }

  Future signup(String email, String password, String userType, String name,
      String phoneNumber) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user.obs;
      String messagingToken =
          await Get.find<NotificationController>().messaging.getToken();
      FirebaseFirestore.instance.collection("Users").doc(user.value.uid).set({
        'uid': user.value.uid,
        'email': user.value.email,
        'userType': userType,
        'name': name,
        'phoneNumber': phoneNumber,
        'token': messagingToken,
        'class': 7,
        'marks': {
          'Sessionals': [
            {'subjectName': 'Hindi', 'marks': 0},
            {'subjectName': 'English', 'marks': 0},
            {'subjectName': 'Maths', 'marks': 0},
          ],
          'Half-Yearly': [
            {'subjectName': 'Hindi', 'marks': 0},
            {'subjectName': 'English', 'marks': 0},
            {'subjectName': 'Maths', 'marks': 0},
          ],
          'Finals': [
            {'subjectName': 'Hindi', 'marks': 0},
            {'subjectName': 'English', 'marks': 0},
            {'subjectName': 'Maths', 'marks': 0},
          ]
        }
      });
      this.userType = userType;
      this.name = name;
      this.phoneNumber = phoneNumber;
      if (userType == "student") {
        Get.offAll(() => StudentHomePage(0));
      } else if (userType == "teacher") {
        Get.offAll(() => TeacherHomepage());
      } else if (userType == 'parent') {
        Get.offAll(() => ParentsHomeScreen());
      }

      isSignedIn = true.obs;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.showSnackbar(new GetBar(
          title: "weak password",
          message: "The password provided is too weak.",
          duration: Duration(
            seconds: 2,
          ),
        ));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.showSnackbar(new GetBar(
          title: "Email already in use",
          message: "The account already exists for that email.",
          duration: Duration(
            seconds: 2,
          ),
        ));
      }
    } catch (e) {
      print(e);
      Get.showSnackbar(new GetBar(
        title: "Error",
        message: e.toString(),
        duration: Duration(
          seconds: 2,
        ),
      ));
    }
  }

  Future signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user.obs;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user.value.uid)
          .get();
      userType = userDoc.data()['userType'];
      name = userDoc.data()['name'];
      phoneNumber = userDoc.data()['phoneNumber'];

      if (userType == "student") {
        Get.offAll(() => StudentHomePage(0));
      } else if (userType == "teacher") {
        Get.offAll(() => TeacherHomepage());
      } else if (userType == 'parent') {
        Get.offAll(() => ParentsHomeScreen());
      }

      isSignedIn = true.obs;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.showSnackbar(new GetBar(
          title: "No User",
          message: "No user found for that email.",
          duration: Duration(
            seconds: 2,
          ),
        ));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
         Get.showSnackbar(new GetBar(
          title: "Wrong Password!",
          message: "Wrong password provided for that user.",
          duration: Duration(
            seconds: 2,
          ),
        ));
      }
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => UserType());
  }

  Future<bool> scheduleACall(
      name, phoneno, bookSlot, description, email) async {
    bool isSuccessfull = false;
    DocumentReference doc =
        await FirebaseFirestore.instance.collection("ScheduleACall").add(
      {
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'name': name,
        'phoneno': phoneno,
        'bookSlot': bookSlot,
        'description': description,
        'uid': user.value.uid,
        'email': email
      },
    );
    if (doc.id != null) {
      return true;
    } else {
      return false;
    }
  }
}
