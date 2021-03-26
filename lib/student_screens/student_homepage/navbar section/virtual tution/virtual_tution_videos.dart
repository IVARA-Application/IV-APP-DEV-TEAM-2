import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/shared/custom_icon_button.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/heal%20my%20mind/videos.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/virtual%20tution/chapterVideosUrl.dart';
import 'package:video_player/video_player.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/heal my mind/videos.dart';

const String loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class TutionVideos extends StatefulWidget {
  final String class_;
  final String subject;
  final String chapterNumber;
  const TutionVideos({Key key, this.chapterNumber, this.class_, this.subject})
      : super(key: key);

  @override
  _TutionVideosState createState() => _TutionVideosState();
}

class _TutionVideosState extends State<TutionVideos> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    // double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: CustomIconButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: kBGdecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Virtual Tuition Courses",
                style: ftt(context).headline5.copyWith(color: Colors.white),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(
                    ChapterVidesUrl
                        .chapterVidesUrl[widget.class_][widget.subject]
                            [widget.chapterNumber]
                        .length,
                    (i) {
                      String topic = ChapterVidesUrl
                          .chapterVidesUrl[widget.class_][widget.subject]
                              [widget.chapterNumber][i]
                          .videoName;
                      String topicNumber = ChapterVidesUrl
                          .chapterVidesUrl[widget.class_][widget.subject]
                              [widget.chapterNumber][i]
                          .topicNumber
                          .toString();
                      String videoDescription = ChapterVidesUrl
                          .chapterVidesUrl[widget.class_][widget.subject]
                              [widget.chapterNumber][i]
                          .description;
                      String videoUrl = ChapterVidesUrl
                          .chapterVidesUrl[widget.class_][widget.subject]
                              [widget.chapterNumber][i]
                          .url;
                      print(topic + topicNumber);
                      return InkWell(
                        onTap: () => setState(() {
                          // !isExpanded ? _controller.forward() : _controller.reverse();
                          isExpanded = !isExpanded;
                        }),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          width: isExpanded ? _width * 0.7 : _width * 0.3,
                          // height: isExpanded ? _height * 0.5 : _height * 0.1,
                          child: !isExpanded
                              ? Card1(
                                  topic: topic,
                                  topicNumber: topicNumber,
                                )
                              : Card2(
                                  topic: topic,
                                  topicNumber: topicNumber,
                                  videoDescription: videoDescription,
                                  videoUrl: videoUrl,
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  final String topicNumber;
  final String topic;
  Card1({Key key, this.topicNumber, this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10)
          .copyWith(right: MediaQuery.of(context).size.width * 0.3),
      shape: kCardShape,
      child: ListTile(
          title: Text(topicNumber + ". " + topic,
              style: Theme.of(context).textTheme.headline5),
          trailing: Icon(
            FontAwesomeIcons.arrowCircleRight,
            color: kDarkBlue,
          )),
    );
  }
}

class Card2 extends StatelessWidget {
  final String topic;
  final String topicNumber;
  final String videoUrl;
  final String videoDescription;
  const Card2({
    Key key,
    this.topic,
    this.topicNumber,
    this.videoUrl,
    this.videoDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: kCardShape,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(topicNumber + ". " + topic,
                  style: Theme.of(context).textTheme.headline5),
              trailing: Icon(
                FontAwesomeIcons.arrowCircleRight,
                color: kDarkBlue,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: CustomVideoPlayer(
                videoPlayerController: VideoPlayerController.network(videoUrl),
              ),
            ),
            Flexible(
              child: Text(
                videoDescription,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
