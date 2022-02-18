import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/constants/styles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
        itemCount: 25,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const CircleAvatar(
                  child: FlutterLogo(),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title',
                        style: cardHeaderTextStyle,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Subtitle',
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
