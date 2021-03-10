import 'package:flutter/material.dart';

class StudentNotification extends StatefulWidget {
  @override
  _StudentNotificationState createState() => _StudentNotificationState();
}

class _StudentNotificationState extends State<StudentNotification> {
  int dateIndex = -1;
  int notificationIndex = -1;
  List notifications = [
    {
      'date': 'Today',
      'notification': [
        {
          'subject': 'English',
          'content': 'Description of message',
          'time': '08:33 a.m'
        },
        {
          'subject': 'Mathematics',
          'content': 'Description of message',
          'time': '09:53 a.m'
        }
      ]
    },
    {
      'date': 'Yesterday',
      'notification': [
        {
          'subject': 'History',
          'content': 'Description of message',
          'time': '12:33 a.m'
        },
        {
          'subject': 'Physics',
          'content': 'Description of message',
          'time': '01:53 p.m'
        }
      ]
    }
  ];

  Widget makeNotificationCards(notif, height, width, dateIndexPassed) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: notif.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.01),
          child: Container(
            width: width * 0.9,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(height * 0.01))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.01, horizontal: width * 0.05),
              child: (dateIndexPassed == dateIndex && notificationIndex == i)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(notif[i]['subject'],
                                style: TextStyle(
                                    fontSize: height * 0.03,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFF5B421))),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    dateIndex = -1;
                                    notificationIndex = -1;
                                  });
                                },
                                icon: Icon(Icons.remove,
                                    color: Color(0xFFF5B421)))
                          ],
                        ),
                        Text(notif[i]['content'],
                            style: TextStyle(color: Color(0xFF999999))),
                        SizedBox(height: height * 0.01),
                        Text(notif[i]['time'],
                            style: TextStyle(color: Color(0xFF999999)))
                      ],
                    )
                  : Row(
                      children: [
                        Container(
                            height: height * 0.05,
                            width: height * 0.05,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(height)),
                                color: Color(0xFFF5B421)),
                            child: Center(
                                child: Text('E',
                                    style: TextStyle(
                                        fontSize: height * 0.03,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)))),
                        SizedBox(width: width * 0.05),
                        Text(notif[i]['subject'],
                            style: TextStyle(
                                fontSize: height * 0.03,
                                fontWeight: FontWeight.w500)),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                dateIndex = dateIndexPassed;
                                notificationIndex = i;
                                print(dateIndex);
                              });
                            },
                            icon: Icon(Icons.add_circle_outline))
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: height * 0.1),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: notifications.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notifications[i]['date'],
                        style: TextStyle(
                            fontSize: height * 0.022, color: Colors.white)),
                    makeNotificationCards(notifications[i]['notification'],
                        height, width, i),
                    SizedBox(height: height * 0.02),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}