import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/constants/styles.dart';
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
                backgroundColor: const Color(0xff075E54),
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
                  tabs: [
                    // Icon(Icons.photo_camera),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'CHATS',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: 26,
                            width: 18,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  '1',
                                  style: cardPrimaryTextStyle.copyWith(
                                    fontSize: 10,
                                    color: const Color(0xff075e54),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'STATUS',
                    ),
                    const Text(
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
