import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/shared/custom_icon_button.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/virtual%20tution/chapterData.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/virtual%20tution/chapterModel.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar%20section/virtual%20tution/virtual_tution_videos.dart';

class TutionChapter extends StatelessWidget {
  final String subject;
  final String class_;
  TutionChapter({Key key, @required this.subject, @required this.class_})
      : super(key: key);

  final Map<String, dynamic> chapters = ChapterData.chapters;

  @override
  Widget build(BuildContext context) {
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
              child: Text(
                "Virtual Tuition Courses",
                style: ftt(context).headline5.copyWith(color: Colors.white),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
              child: Text(
                subject,
                style: ftt(context).headline6.copyWith(color: Colors.white),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    chapters[class_][subject].length,
                    (i) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TutionVideos(
                              chapterNumber: (i+1).toString(),
                              class_: class_,
                              subject: subject,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: kCardShape,
                          padding: EdgeInsets.all(8),
                          primary: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                (i + 1).toString() +
                                    ". " +
                                    chapters[class_][subject][i].chapterName,
                                style: ftt(context)
                                    .headline6
                                    .copyWith(color: kLightBlue),
                              ),
                            ),
                            Icon(
                              FontAwesomeIcons.arrowCircleRight,
                              color: kDarkBlue,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
