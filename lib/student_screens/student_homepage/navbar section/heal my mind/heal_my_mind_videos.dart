import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:new_ivara_app/student_screens/drawer.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/heal my mind/videos.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/navbar.dart';

class HealMyMindVideosPage extends StatefulWidget {
  static String id = 'HealMyMindVideosPage';
  @override
  _HealMyMindVideosPageState createState() => _HealMyMindVideosPageState();
}

class _HealMyMindVideosPageState extends State<HealMyMindVideosPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List videos = [];
  @override
  Widget build(BuildContext context) {
    int index = 0;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      drawer: StudentDrawer(),
      body: FutureBuilder<QuerySnapshot>(
        future:FirebaseFirestore.instance.collection("HealMyMindVideos").get(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(child: CircularProgressIndicator(),);
          }
          snapshot.data.docs.forEach((doc) { 
            videos.add({
              'image':doc.data()['videoThumbnail'],
              'name':doc.data()['title'],
              'url':doc.data()['videoUrl']
            });
          });

          return Stack(
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
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.15, bottom: screenHeight * 0.03),
                      child: Text(
                        "Heal My Mind Videos",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: videos.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VideosCardPage(videos, index)));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: screenWidth * 0.07,
                                      left: screenWidth * 0.07),
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: screenHeight * 0.12,
                                            width: screenWidth * 0.38,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      videos[index]['image']),
                                                  fit: BoxFit.cover,
                                                  colorFilter: ColorFilter.mode(
                                                      Colors.black45,
                                                      BlendMode.darken)),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10.0),
                                                  bottomLeft:
                                                      Radius.circular(10.0)),
                                            ),
                                          ),
                                          Positioned(
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: Colors.white,
                                              size: 50,
                                            ),
                                            top: screenHeight * 0.03,
                                            left: screenWidth * 0.12,
                                          )
                                        ],
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            height: screenHeight * 0.12,
                                            width: screenWidth * 0.48,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10.0),
                                                  bottomRight:
                                                      Radius.circular(10.0)),
                                            ),
                                          ),
                                          Positioned(
                                            child: Text(
                                              videos[index]['name'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 22),
                                            ),
                                            top: screenHeight * 0.04,
                                            left: screenWidth * 0.04,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })),
                  ],
                ),
              ),
              StudentNavbar(_scaffoldKey),
            ],
          );
        }
      ),
    );
  }
}
