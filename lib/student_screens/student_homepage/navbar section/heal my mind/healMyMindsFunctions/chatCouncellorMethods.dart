import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
class ChatToCouncellorMethods {
  static Future sendTextMessage(CollectionReference chatRoomReference,
      String userId, String displayName, messageController) {
    String message = messageController.text;
    messageController.text = "";
    chatRoomReference.add(
      {
        'sender': userId,
        'message': message,
        'time': DateTime.now(),
        'type': "text",
        'senderName': displayName,
      },
    ).then((value) {});
  }

  static Future sendImageMessage(CollectionReference chatRoomReference, String userId,
      String displayName) async {
   
    final _picker = ImagePicker();
    PickedFile selected =
        await _picker.getImage(source: ImageSource.camera, imageQuality: 70);
    if (selected != null) {
       String docId = DateTime.now().toString();
      chatRoomReference.doc(docId).set(
        {
          'sender': userId,
          'time': DateTime.now(),
          'type': "image",
          'imageUrl': "",
          'message': "",
          'senderName': displayName,
        },
      );

      firebase_storage.TaskSnapshot taskSnapshot = await firebase_storage
          .FirebaseStorage.instance
          .ref('images/${DateTime.now()}')
          .putFile(new File(selected.path));
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      print(downloadUrl);
      chatRoomReference.doc(docId).set(
        {
          'sender': userId,
          'time': DateTime.now(),
          'type': "image",
          'imageUrl': downloadUrl,
          'message': "",
          'senderName': displayName
        },
      ).then((value) {});
    }
  }

   static Future sendFiles(CollectionReference chatRoomReference, String userId,
      String displayName) async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'txt', 'zip'],
      allowCompression: true,
    );
    String docId = DateTime.now().microsecondsSinceEpoch.toString();
    if (result != null) {
      File file = File(result.files.single.path);
      String fileName = result.files.single.name;
      String extensions = result.files.single.extension;
      chatRoomReference.doc(docId).set(
        {
          'sender': userId,
          'time': DateTime.now(),
          'type': 'file',
          'imageUrl': "",
          'message': "",
          'senderName': displayName,
          'fileName': fileName,
          'fileExtension': extensions
        },
      );

      firebase_storage.TaskSnapshot taskSnapshot = await firebase_storage
          .FirebaseStorage.instance
          .ref('images/${DateTime.now()}')
          .putFile(file);
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      print(downloadUrl);
      chatRoomReference.doc(docId).set(
        {
          'sender': userId,
          'time': DateTime.now(),
          'type': "file",
          'imageUrl': downloadUrl,
          'message': "",
          'senderName': displayName,
          'fileName': fileName,
          'fileExtension': extensions
        },
      ).then((value) {});
    } else {}
  }
}
