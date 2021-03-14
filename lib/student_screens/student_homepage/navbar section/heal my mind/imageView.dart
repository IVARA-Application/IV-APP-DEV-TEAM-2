import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  String imageUrl;
  String senderName;
  ImageView(this.imageUrl, this.senderName);
  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.senderName,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: InteractiveViewer(
              child: Container(
          child: Hero(
            tag: widget.imageUrl,
            child: CachedNetworkImage(imageUrl: widget.imageUrl),
          ),
        ),
      ),
    );
  }
}
