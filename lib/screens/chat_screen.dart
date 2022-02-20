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
        onPressed: () {},
        child: const Icon(
          Icons.chat,
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10),
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
                      Text(
                        userList[index]['company']['catchPhrase'],
                        style: cardPrimaryTextStyle,
                      ),
                    ],
                  ),
                ),
                Text(
                  '14:12',
                  style: cardSecondaryTextStyle.copyWith(fontSize: 10),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
