import 'package:flutter/material.dart';
class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Group"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Text("GroupScreen"),
      ),

    );
  }
}
