import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:new_ivara_app/student_screens/student_homepage/navbar section/study abroad/blogs/blogs_card.dart';

import '../../../../drawer.dart';
import '../../navbar.dart';

class BlogsPage extends StatefulWidget {
  static String id = 'BlogsPage';
  @override
  _BlogsPageState createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List blogs = [];
  @override
  Widget build(BuildContext context) {
    int index = 0;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        drawer: StudentDrawer(),
        body: Stack(children: [
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
                      top: screenHeight * 0.1, bottom: screenHeight * 0.01),
                  child: Text(
                    "News & Blogs",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance
                        .collection("NewsAndBlogs")
                        .orderBy(
                          'timestamp',
                          descending: true
                        )
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }

                      if (snapshot.hasError) {
                        return CircularProgressIndicator();
                      }
                      snapshot.data.docs.forEach((doc) {
                        blogs.add({
                          'name': doc['name'],
                          'description': doc['description'],
                          'image': doc['image'],
                        });
                      });
                      return Expanded(
                        child: ListView.builder(
                            itemCount: blogs.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BlogsCardPage(blogs, index)))
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
                                                    blogs[index]['image'],
                                                  ),
                                                  fit: BoxFit.cover,
                                                  colorFilter: ColorFilter.mode(
                                                      Colors.black45,
                                                      BlendMode.darken)),
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.0),
                                                  bottomLeft:
                                                      Radius.circular(10.0)),
                                            ),
                                          ),
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
                                                  topRight:
                                                      Radius.circular(10.0),
                                                  bottomRight:
                                                      Radius.circular(10.0)),
                                            ),
                                          ),
                                          Positioned(
                                            child: Text(
                                              blogs[index]['name'],
                                              style: TextStyle(
                                                  color: Color(0xFF697AE4),
                                                  fontSize: 25),
                                            ),
                                            top: screenHeight * 0.025,
                                            left: screenWidth * 0.04,
                                          ),
                                          Positioned(
                                            child: Text(
                                              blogs[index]['description'],
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15),
                                            ),
                                            top: screenHeight * 0.07,
                                            left: screenWidth * 0.04,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    }),
                SizedBox(
                  height: 2,
                )
              ],
            ),
          ),
          StudentNavbar(_scaffoldKey),
        ]));
  }
}
