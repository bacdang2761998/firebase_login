import 'package:flutter/material.dart';
class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:AppBar(
      //   title: Text("Game"),
      //   backgroundColor: Colors.blue,
      //   centerTitle: true,
      // ),
      body: Center(
        child: Text("GameScreen"),
      ),

    );
  }
}
