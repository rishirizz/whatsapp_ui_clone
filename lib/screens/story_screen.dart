import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final storycontroller = StoryController();
  final List<StoryItem> storyItems = [
    StoryItem.text(
      title: "Hello Guys, Welcome to Proto Coders Point",
      backgroundColor: const Color(0x00ffffff),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: StoryView(
        controller: storycontroller,
        inline: false,
        repeat: false,
        onComplete: () => Navigator.pop(context),
        storyItems: storyItems,
      ),
    );
  }
}
