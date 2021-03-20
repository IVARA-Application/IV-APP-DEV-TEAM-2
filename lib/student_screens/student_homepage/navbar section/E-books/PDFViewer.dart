import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PDFViewer extends StatefulWidget {
  String _class, subject, type;
  PDFViewer(this._class, this.subject, this.type);
  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('EBooks')
              .doc(widget._class)
              .collection(widget._class)
              .doc(widget.subject)
              .collection(widget.subject)
              .doc(widget.type)
              .get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            String url;
            if (snapshot.data.exists) {
              url = snapshot.data.data()['pdfUrl'];
            }
            if(url==null){
              return Center(
                child: Container(
                  child: Text("File don't exists"),
                ),
              );
            }

            return PDF().cachedFromUrl(
              url,
              placeholder: (double progress) => Center(
                  child: CircularProgressIndicator(
                value: progress,
              )),
              errorWidget: (dynamic error) =>
                  Center(child: Text(error.toString())),
            );
          }),
    );
  }
}
