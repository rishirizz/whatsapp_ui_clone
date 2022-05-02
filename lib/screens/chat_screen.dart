import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:whatsapp_ui_clone/constants/styles.dart';
import 'package:whatsapp_ui_clone/services/api_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List userList = [];
  List photosList = [];
  List<String> timeList = [
    '17:58',
    '16:47',
    '13:07',
    '10:00',
    '9:21',
    'Yesterday',
    'Yesterday',
    '17/02/2022',
    '17/02/2022',
    '17/02/2022',
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
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {},
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: photosList[index]['url'],
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
                      Text(
                        userList[index]['name'],
                        style: cardHeaderTextStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          if (index != 0)
                            Icon(
                              Icons.done_all,
                              color: (index == 0 || index == 1 || index == 4)
                                  ? const Color(0xff707070)
                                  : Colors.blue,
                              size: 18,
                            ),
                          Padding(
                            padding: (index != 0)
                                ? const EdgeInsets.only(left: 4.0)
                                : const EdgeInsets.all(0),
                            child: Text(
                              userList[index]['company']['catchPhrase'],
                              style: cardPrimaryTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      timeList[index],
                      style: cardSecondaryTextStyle.copyWith(
                        fontSize: 10,
                        color: (index == 0)
                            ? const Color(0xff25D366)
                            : Colors.black87,
                      ),
                    ),
                    if (index == 0)
                      Container(
                        height: 26,
                        width: 18,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff25D366),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              '1',
                              style: cardPrimaryTextStyle.copyWith(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
