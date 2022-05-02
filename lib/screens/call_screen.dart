import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:whatsapp_ui_clone/constants/styles.dart';
import 'package:whatsapp_ui_clone/services/api_service.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  List userList = [];
  List photosList = [];
  List<String> timeList = [
    '16 February, 20:22',
    '11 February, 21:03',
    '19 January, 18:18',
    '11 January, 18:45',
    '(3) 31/12/21, 13:24',
    '19/12/21, 08:53',
    '01/11/21, 12:45',
    '17/10/21, 00:00',
  ];

  @override
  void initState() {
    super.initState();
    getNames().then((names) {
      setState(() {
        userList = names;
      });
    });
    getPhotos().then((photos) {
      setState(() {
        photosList = photos;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {},
        child: const Icon(
          Icons.add_ic_call,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          getImage() {
            if (index == 0 || index == 2 || index == 3) {
              return photosList[3]['url'];
            } else if (index == 1 || index == 7) {
              return photosList[9]['url'];
            } else if (index == 4 || index == 5 || index == 6) {
              return photosList[1]['url'];
            }
          }

          return Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: getImage(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (index == 0 || index == 2 || index == 3)
                        Text(
                          userList[3]['name'],
                          style: cardHeaderTextStyle,
                        ),
                      if (index == 1 || index == 7)
                        Text(
                          userList[9]['name'],
                          style: cardHeaderTextStyle,
                        ),
                      if (index == 4 || index == 5 || index == 6)
                        Text(
                          userList[1]['name'],
                          style: cardHeaderTextStyle,
                        ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            (index == 1 || index == 2 || index == 7)
                                ? Icons.call_received
                                : Icons.call_made,
                            color: (index == 4 || index == 1)
                                ? Colors.red
                                : const Color(0xff075E54),
                            size: 18,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              timeList[index],
                              style: cardPrimaryTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  (index == 3 || index == 5 || index == 7)
                      ? Icons.call
                      : Icons.videocam,
                  color: Colors.teal[800],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
