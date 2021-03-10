import 'package:condition/condition.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DoubtPortalPage extends StatefulWidget {
  static String id = 'ChatToCounsellorPage';
  DoubtPortalPage({Key key}) : super(key: key);

  @override
  _DoubtPortalPageState createState() => _DoubtPortalPageState();
}

class _DoubtPortalPageState extends State<DoubtPortalPage> {
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
    return Scaffold(
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => {Navigator.pop(context)},
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/icons/tab.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/icons/back.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenHeight * 0.015),
                              child: Text(
                                "Chat To Counsellor",
                                style:
                                    TextStyle(fontSize: 25, color: Colors.white),
                              ),
                            ),
                          ),
                    MessageStream(),
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
                                          keyboardType: TextInputType.multiline,
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
                                        _pickImage(ImageSource.camera);
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.attach_file,
                                          color: Color(0xFF697AE4)),
                                      onPressed: () {
                                        _pickImage(ImageSource.gallery);
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
                                onLongPress: () {},
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
                                padding: const EdgeInsets.symmetric(horizontal: 0),
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
        ],
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> messages = [
      {'text': 'Thanks.', 'sender': 'Me', 'time': '08:20 PM'},
      {
        'text': 'No issues, let me look into your problem.',
        'sender': 'Counsellor',
        'time': '08:20 PM'
      },
      {
        'text':
        'But I was having a litte bit of problem regarding online lectures, videos arent loading.',
        'sender': 'Me',
        'time': '08:20 PM'
      },
      {
        'text': 'Sorry to disturb you at the uneven hour.',
        'sender': 'Me',
        'time': '08:23 PM'
      },
      {'text': 'Hey David !', 'sender': 'Counsellor', 'time': '08:23 PM'},
      {'text': 'Hello.', 'sender': 'Me', 'time': '08:20 PM'},
    ];
    List<MessageBubble> messageBubbles = [];
    for (var message in messages) {
      final messageText = message['text'];
      final messageSender = message['sender'];
      final messageTime = message['time'];
      String currentUser = 'Me';
      final messageBubble = MessageBubble(
        text: messageText,
        sender: messageSender,
        time: messageTime,
        isMe: messageSender == currentUser,
      );
      messageBubbles.add(messageBubble);
    }
    return Expanded(child: ListView(reverse: true, children: messageBubbles));
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final String time;
  final bool isMe;
  MessageBubble({this.text, this.sender, this.isMe, this.time});
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
                      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: screenHeight*0.02
                          ),
                          child: Text(
                            sender,
                            style: TextStyle(fontSize: 10, color:Color(0xFF697AE4)),
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
                  Text(
                    text,
                    style: TextStyle(color: isMe ? Color(0xFF697AE4) : Colors.white),
                  ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            time,
                            style: TextStyle(fontSize: 10, color: isMe ? Color(0xFF697AE4) : Colors.white),
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
