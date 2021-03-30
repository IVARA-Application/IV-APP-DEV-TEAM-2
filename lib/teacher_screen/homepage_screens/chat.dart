import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:condition/condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_ivara_app/Controllers/authController.dart';
import 'package:new_ivara_app/student_screens/drawer.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/24X7DoubtPortal/DoubtPortalMethods.dart';
import 'dart:io';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/heal%20my%20mind/imageView.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/navbar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class TeacherChatPage extends StatefulWidget {
  int _class = 6;
  static String id = 'TeacherChatPage';
  TeacherChatPage({Key key}) : super(key: key);

  @override
  _TeacherChatPageState createState() => _TeacherChatPageState();
}

class _TeacherChatPageState extends State<TeacherChatPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  File _imageFile;
  String messageText;
  final messageTextController = TextEditingController();
  final _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    PickedFile selected = await _picker.getImage(source: source);
    setState(() {
      if (selected != null) {
        _imageFile = File(selected.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final uid = Get.find<AuthController>().user.value.uid;
    CollectionReference chatRoomReference =
        FirebaseFirestore.instance.collection("doubtPortalChats");
    return Scaffold(
      key: _scaffoldKey,
      drawer: StudentDrawer(),
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                //     stops: [
                //   0.1,
                //   0.4,
                //   0.6,
                //   0.9
                // ],
                colors: [
                  Color(0xFF8569C5),
                  Color(0xFFC579B5),
                  Color(0xFFF48380),
                  Color(0xFFF3D37B),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Conditioned.boolean(_imageFile == null,
                trueBuilder: () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.05),
                            child: Text(
                              "Doubt Portal",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),
                        ),
                        MessageStream(
                            chatRoomReference,
                            widget._class,
                            Get.find<AuthController>()
                                .user
                                .value
                                .uid
                                .toString()),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenHeight * 0.01,
                              vertical: screenWidth * 0.02),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                // Expanded(
                                //   child: TextField(
                                //     controller: messageTextController,
                                //     onChanged: (value) {
                                //       messageText = value;
                                //     },
                                //     decoration: InputDecoration(
                                //       contentPadding: EdgeInsets.symmetric(
                                //           vertical: 10.0, horizontal: 20.0),
                                //       hintText: 'Type your message here...',
                                //       border: InputBorder.none,
                                //     ),
                                //   ),
                                // ),
                                // FlatButton(
                                //   onPressed: () {},
                                //   child: Icon(LineAwesomeIcons.telegram_plane)
                                // ),

                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(35.0),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 3),
                                            blurRadius: 5,
                                            color: Colors.grey)
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: TextField(
                                              controller: messageTextController,
                                              keyboardType:
                                                  TextInputType.multiline,
                                              maxLines: null,
                                              decoration: InputDecoration(
                                                  hintText: "Type Something...",
                                                  hintStyle: TextStyle(
                                                      color: Color(0xFF697AE4)),
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.photo_camera,
                                              color: Color(0xFF697AE4)),
                                          onPressed: () {
                                            DoubtPortalMethods.sendImageMessage(
                                                chatRoomReference,
                                                Get.find<AuthController>()
                                                    .user
                                                    .value
                                                    .uid
                                                    .toString(),
                                                Get.find<AuthController>()
                                                    .user
                                                    .value
                                                    .email
                                                    .toString());
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.attach_file,
                                              color: Color(0xFF697AE4)),
                                          onPressed: () {
                                            DoubtPortalMethods.sendFiles(
                                                chatRoomReference,
                                                Get.find<AuthController>()
                                                    .user
                                                    .value
                                                    .uid
                                                    .toString(),
                                                Get.find<AuthController>()
                                                    .user
                                                    .value
                                                    .email
                                                    .toString());
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Container(
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF697AE4),
                                      shape: BoxShape.circle),
                                  child: InkWell(
                                    child: Icon(
                                      LineAwesomeIcons.telegram,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      if (messageTextController.text
                                          .trim()
                                          .isNotEmpty) {
                                        print("Message Send");
                                        DoubtPortalMethods.sendTextMessage(
                                            chatRoomReference,
                                            Get.find<AuthController>()
                                                .user
                                                .value
                                                .uid
                                                .toString(),
                                            Get.find<AuthController>()
                                                .user
                                                .value
                                                .email,
                                            messageTextController);
                                      }
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                falseBuilder: () => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: Container(
                            height: screenHeight - (screenHeight * 0.1763),
                            color: Colors.black,
                            child: Image.file(_imageFile),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: Container(
                              child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: Container(
                                    height: screenHeight * 0.07,
                                    width: screenWidth / 2,
                                    color: Colors.redAccent,
                                    child: IconButton(
                                        icon: Icon(LineAwesomeIcons.times),
                                        onPressed: () => {
                                              setState(() {
                                                _imageFile = null;
                                              })
                                            })),
                              ),
                              Container(
                                  height: screenHeight * 0.07,
                                  width: screenWidth / 2,
                                  color: Colors.greenAccent,
                                  child: IconButton(
                                      icon: Icon(LineAwesomeIcons.check),
                                      onPressed: null))
                            ],
                          )),
                        )
                      ],
                    )),
          ),
          StudentNavbar(_scaffoldKey),
        ],
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  CollectionReference chatRoomReference;
  int _class;
  String userId;
  MessageStream(this.chatRoomReference, this._class, this.userId);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: chatRoomReference.orderBy('time', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Expanded(
                child: Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ));
          }
          if (!snapshot.hasData) {
            return Expanded(
                child: Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ));
          }
          print(snapshot.data.docs.length);

          List<Map<String, dynamic>> messages = [];
          snapshot.data.docs.forEach((doc) {
            messages.add({
              'text': doc['message'],
              'sender': doc['sender'],
              'senderName': doc['senderName'],
              'time': doc['time'].toDate(),
              'type': doc['type'],
              'imageUrl': doc['type'] == "text" ? "" : doc['imageUrl'],
              'fileName': doc['type'] == 'file' ? doc['fileName'] : "",
              'fileExtension':
                  doc['type'] == 'file' ? doc['fileExtension'] : "",
            });
          });
          List<MessageBubble> messageBubbles = [];
          for (var message in messages) {
            final messageText = message['text'];
            final messageSender = message['sender'];
            DateTime messageTime = message['time'];
            String currentUser = userId;
            String imageUrl = message['imageUrl'];
            String type = message['type'];
            String messageSenderName = message['senderName'];
            String fileName = message['fileName'];
            String fileExtension = message['fileExtension'];
            final messageBubble = MessageBubble(
              text: messageText,
              sender: messageSender,
              time: "${messageTime.hour}:${messageTime.minute}",
              isMe: messageSender == currentUser,
              imageUrl: imageUrl,
              type: type,
              senderName: messageSenderName,
              fileName: fileName,
              fileExtension: fileExtension,
            );
            messageBubbles.add(messageBubble);
          }
          return Expanded(
              child: ListView(reverse: true, children: messageBubbles));
        });
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final String time;
  final bool isMe;
  final String imageUrl;
  final String type;
  final String senderName;
  final String fileName;
  final String fileExtension;
  MessageBubble({
    this.text,
    this.sender,
    this.isMe,
    this.time,
    this.imageUrl,
    this.type,
    this.senderName,
    this.fileName,
    this.fileExtension,
  });
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(1),
            child: Row(
              mainAxisAlignment:
                  isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: screenHeight * 0.02),
                  child: Text(
                    senderName,
                    style: TextStyle(fontSize: 10, color: Color(0xFF697AE4)),
                  ),
                )
              ],
            ),
          ),
          Material(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(13),
              bottomRight: Radius.circular(13),
              topLeft: isMe ? Radius.circular(13) : Radius.circular(0),
              topRight: isMe ? Radius.circular(0) : Radius.circular(13),
            ),
            elevation: 5,
            color: isMe ? Colors.white : Color(0xFF697AE4),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  type == "text"
                      ? Text(
                          text,
                          style: TextStyle(
                              color: isMe ? Color(0xFF697AE4) : Colors.white),
                        )
                      : type == "image"
                          ? Container(
                              width: screenWidth * 0.6,
                              height: 100,
                              child: imageUrl == ""
                                  ? Center(
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                ImageView(imageUrl, senderName),
                                          ));
                                        },
                                        child: Hero(
                                          tag: imageUrl,
                                          child: CachedNetworkImage(
                                            imageUrl: imageUrl,
                                            fit: BoxFit.fitWidth,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                Center(
                                              child: Container(
                                                width: 20,
                                                height: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                        value: downloadProgress
                                                            .progress),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                    ),
                            )
                          : Container(
                              width: screenWidth * 0.6,
                              height: 40,
                              child: imageUrl == ""
                                  ? Center(
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () async {
                                        print('dfdsfds');

                                        final status =
                                            await Permission.storage.request();
                                        if (status.isGranted) {
                                          final externalDir =
                                              await getExternalStorageDirectory();

                                          final taskId =
                                              await FlutterDownloader.enqueue(
                                            url: imageUrl,
                                            showNotification: true,
                                            fileName: fileName,
                                            savedDir: externalDir.path,
                                            openFileFromNotification: true,
                                          );
                                        } else {
                                          print("Permission Denied");
                                        }
                                      },
                                      child: Container(
                                          child: Row(
                                        children: [
                                          Image.asset(
                                            fileExtension == 'pdf'
                                                ? 'assets/pdf.png'
                                                : fileExtension == 'txt'
                                                    ? 'assets/txt.png'
                                                    : fileExtension == 'zip'
                                                        ? 'assets/zip.png'
                                                        : '',
                                          ),
                                          SizedBox(width: 5),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: Text(
                                              "$fileName",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: isMe
                                                    ? Colors.black
                                                    : Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                    ),
                            ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      time,
                      style: TextStyle(
                          fontSize: 10,
                          color: isMe ? Color(0xFF697AE4) : Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
