import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_ivara_app/constant/colours.dart';
import 'package:new_ivara_app/constant/constants.dart';
import 'package:new_ivara_app/shared/custom_icon_button.dart';

String _src =
    'https://images.unsplash.com/photo-1615266895738-11f1371cd7e5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1349&q=80';

const String loremIpsum =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class TutionVideos extends StatefulWidget {
  const TutionVideos({Key key}) : super(key: key);

  @override
  _TutionVideosState createState() => _TutionVideosState();
}

class _TutionVideosState extends State<TutionVideos> {
  Widget _child = Card1();
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
        centerTitle: true,
      ),
      body: Container(
        decoration: kBGdecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 56),
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
                    10,
                    (i) => InkWell(
                      onTap: () => setState(() {
                        _child = isExpanded ? Card1() : Card2();
                        // !isExpanded ? _controller.forward() : _controller.reverse();
                        isExpanded = !isExpanded;
                      }),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        width: isExpanded ? _width * 0.7 : _width * 0.3,
                        // height: isExpanded ? _height * 0.5 : _height * 0.1,
                        child: _child,
                      ),
                    ),
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
  const Card1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10)
          .copyWith(right: MediaQuery.of(context).size.width * 0.3),
      shape: kCardShape,
      child: ListTile(
          title: Text('1.1 Video Title',
              style: Theme.of(context).textTheme.headline5),
          trailing: Icon(
            FontAwesomeIcons.arrowCircleRight,
            color: kDarkBlue,
          )),
    );
  }
}

class Card2 extends StatelessWidget {
  const Card2({Key key}) : super(key: key);

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
              title: Text('1.1 Video Title',
                  style: Theme.of(context).textTheme.headline5),
              trailing: Icon(
                FontAwesomeIcons.arrowCircleRight,
                color: kDarkBlue,
              ),
            ),
            Flexible(child: Image.network(_src)),
            Flexible(
              child: Text(
                loremIpsum,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
