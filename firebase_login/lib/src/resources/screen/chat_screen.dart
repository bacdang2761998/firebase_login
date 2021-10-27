import 'package:flutter/material.dart';
class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Chat"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Text("ChatScreen"),
      ),

    );
  }
}
