import 'package:firebase_login/src/resources/home_screen.dart';
import 'package:firebase_login/src/resources/screen/chat_screen.dart';
import 'package:firebase_login/src/resources/screen/game_screen.dart';
import 'package:firebase_login/src/resources/screen/group_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
  Widget _homeScreen = HomeScreen();
  Widget _chatScreen = ChatScreen();
  Widget _gameScreen = GameScreen();
  Widget _groupScreen = GroupScreen();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            color:  Colors.black12,
            offset: Offset(2,3),
            blurRadius: 3
          )]
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: this.selectedIndex,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: this.selectedIndex == 0 ? Colors.green : Colors.white60,
            label:"Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                backgroundColor: this.selectedIndex == 1 ? Colors.green : Colors.white60,
                label:"Chat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.games_outlined),
                backgroundColor: this.selectedIndex == 2 ? Colors.green : Colors.white60,
                label:"Game"),
            BottomNavigationBarItem(
                icon: Icon(Icons.group),
                backgroundColor: this.selectedIndex == 3 ? Colors.green : Colors.white60,
                label:"Group"),
          ],
          onTap: (int index){
            onTabHandler(index);
          },
        ),
      ),
    );
  }
  Widget _buildBody(){
    if (this.selectedIndex == 0) {
      return this._homeScreen;
    } else if (this.selectedIndex == 1) {
      return this._chatScreen;
    } else if (this.selectedIndex == 2) {
      return this._gameScreen;
    } else {
      return this._groupScreen;
    }
  }

  void onTabHandler(int index){
    this.setState(() {
        this.selectedIndex = index;
    });
  }
}
