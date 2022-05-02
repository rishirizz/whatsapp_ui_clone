import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:whatsapp_ui_clone/screens/story_screen.dart';
import 'package:whatsapp_ui_clone/services/api_service.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
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
    return Container(
      color: Colors.grey[300],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListTile(
                leading: Stack(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://cdn2.vectorstock.com/i/1000x1000/23/81/default-avatar-profile-icon-vector-18942381.jpg"),
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 1.0,
                      child: Container(
                        height: 20,
                        width: 20,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15,
                        ),
                        decoration: const BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                      ),
                    ),
                  ],
                ),
                title: const Text(
                  "My Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text("Tap to add status update"),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Viewed updates",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: photosList[0]['url'],
                      ),
                    ),
                  ),
                  title: Text(
                    userList[0]['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    " 18 minutes ago",
                  ),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StoryPage())),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: photosList[4]['url'],
                      ),
                    ),
                  ),
                  title: Text(
                    userList[4]['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    " 23 minutes ago",
                  ),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StoryPage())),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: photosList[7]['url'],
                      ),
                    ),
                  ),
                  title: Text(
                    userList[7]['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    " 45 minutes ago",
                  ),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StoryPage())),
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: photosList[1]['url'],
                      ),
                    ),
                  ),
                  title: Text(
                    userList[1]['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    " 57 minutes ago",
                  ),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StoryPage())),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
