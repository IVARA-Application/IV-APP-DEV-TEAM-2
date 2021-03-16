import 'package:carousel_pro/carousel_pro.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/student_screens/drawer.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/navbar.dart';
import 'package:video_player/video_player.dart';

// import 'package:new_ivara_app/student_screens/student_homepage/navbar section/study abroad/courses/courses.dart';
// import 'package:new_ivara_app/student_screens/student_homepage/navbar section/study abroad/scholarships/scholarships.dart';

class VideosCardPage extends StatefulWidget {
  List videos;
  int index;
  VideosCardPage(this.videos, this.index);
  static String id = 'VideosCardPage';

  @override
  _VideosCardPageState createState() => _VideosCardPageState(videos, index);
}

class _VideosCardPageState extends State<VideosCardPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List videos;
  int index;
  _VideosCardPageState(this.videos, this.index);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: StudentDrawer(),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8569C5),
              Color(0xFFC579B5),
              Color(0xFFF48380),
              Color(0xFFF3D37B),
            ],
          ),
        ),
        child: Stack(
          children: [
            CustomVideoPlayer(
              videoPlayerController:
                  VideoPlayerController.network(videos[index]['url']),
            ),
            Positioned(
              top: screenHeight * 0.25,
              left: screenWidth * 0.37,
              child: Text(
                videos[index]['name'],
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            StudentNavbar(_scaffoldKey),
          ],
        ),
      ),
    );
  }
}

class CustomVideoPlayer extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool loop;
  CustomVideoPlayer({this.videoPlayerController, this.loop});

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: 16 / 9,
        autoInitialize: true,
        autoPlay: true,
        looping: widget.loop??false,
        errorBuilder: (constext, errorMessage) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chewie(controller: _chewieController),
    );
  }

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
