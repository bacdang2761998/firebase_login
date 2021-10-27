import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/src/model/user_model.dart';
import 'package:firebase_login/src/resources/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    final PageStorageBucket bucket = PageStorageBucket();
    Widget currentScreen = HomeScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Image.asset(
                "assets/images/ic_logo.png",
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "Welcom Back",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${loggedInUser.firstName} ${loggedInUser.secondName}",
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            Text(
              "${loggedInUser.email}",
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            ),
            ActionChip(
                label: Text("LogOut"),
                onPressed: () {
                  logout(context);
                })
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
