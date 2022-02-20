import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/screens/call_screen.dart';
import 'package:whatsapp_ui_clone/screens/chat_screen.dart';
import 'package:whatsapp_ui_clone/screens/status_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool isBoxScrolled) {
            return <Widget>[
              SliverAppBar(
                actions: const [
                  Icon(Icons.search),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.more_vert),
                  ),
                ],
                title: const Text(
                  'WhatsApp',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
                centerTitle: false,
                pinned: true,
                floating: true,
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  labelPadding: const EdgeInsets.only(
                    bottom: 5,
                  ),
                  controller: _tabController,
                  tabs: const [
                    // Icon(Icons.photo_camera),
                    Text(
                      'CHATS',
                    ),
                    Text(
                      'STATUS',
                    ),
                    Text(
                      'CALLS',
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: const [
              // CameraScreen(),
              ChatScreen(),
              StatusScreen(),
              CallScreen(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }
}
