import 'package:flutter/cupertino.dart';

class VideoModel {
  int topicNumber;
  String videoName;
  String url;
  String description;

  VideoModel({
    @required this.topicNumber,
    @required this.url,
    @required this.videoName,
    @required this.description,
  });
}
