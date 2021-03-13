import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:new_ivara_app/screens/user_type.dart';
import 'package:new_ivara_app/student_screens/student_homepage/studentHomepage.dart';

class AuthController extends GetxController {
  RxBool isSignedIn = false.obs;
  FirebaseAuth auth = FirebaseAuth.instance;
  Rx<User> user;
  String userType = "";
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
          DocumentSnapshot userDoc = await FirebaseFirestore.instance
              .collection("Users")
              .doc(user.value.uid)
              .get();
          userType = userDoc.data()['userType'];
          isSignedIn = true.obs;
          print("User is signed in");
          Get.offAll(() => StudentHomePage(0));
        }
      },
    );
  }

  Future signup(String email, String password, String userType) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user.obs;
      FirebaseFirestore.instance.collection("Users").doc(user.value.uid).set({
        'uid': user.value.uid,
        'email': user.value.email,
        'userType': userType,
      });
      Get.offAll(() => StudentHomePage(0));

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
      user.value = userCredential.user;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user.value.uid)
          .get();
      userType = userDoc.data()['userType'].obs;
      Get.offAll(() => StudentHomePage(0));
      isSignedIn = true.obs;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => UserType());
  }
}
