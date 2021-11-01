import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/src/model/user_model.dart';
import 'package:firebase_login/src/resources/bottom_bar.dart';
import 'package:firebase_login/src/resources/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final firstNameEdittingController = new TextEditingController();
  final secondNameEdittingController = new TextEditingController();
  final emailEdittingController = new TextEditingController();
  final passwordEdittingController = new TextEditingController();
  final confimPasswordEdittingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firstNameFiled = TextFormField(
      autofocus: false,
      controller: firstNameEdittingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regExp = new RegExp(r'^.{2,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regExp.hasMatch(value)) {
          return ("Please Enter Valid Name(Min 2 Character)");
        }
        return null;
      },
      onSaved: (value) {
        firstNameEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final secondNameFiled = TextFormField(
      autofocus: false,
      controller: secondNameEdittingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Second Name cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        secondNameEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final emailFiled = TextFormField(
      autofocus: false,
      controller: emailEdittingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        if (!RegExp("^[a-zA-z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailEdittingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final passwordFiled = TextFormField(
      autofocus: false,
      controller: passwordEdittingController,
      obscureText: true,
      validator: (value) {
        RegExp regExp = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is requied for login");
        }
        if (value.length < 6) {
          return ("Please Enter Valid Password(Min 6 Character)");
        }
      },
      onSaved: (value) {
        passwordEdittingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final confimPasswordFiled = TextFormField(
      autofocus: false,
      controller: confimPasswordEdittingController,
      obscureText: true,
      validator: (value) {
        // if (value != passwordEdittingController) {
        //   return "Password don't match";
        // }
      },
      onSaved: (value) {
        confimPasswordEdittingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confim Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEdittingController.text, passwordEdittingController.text);
        },
        child: Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      child: Image.asset('assets/images/ic_logo.png',
                          fit: BoxFit.contain),
                    ),
                    SizedBox(height: 45),
                    firstNameFiled,
                    SizedBox(height: 20),
                    secondNameFiled,
                    SizedBox(height: 20),
                    emailFiled,
                    SizedBox(height: 20),
                    passwordFiled,
                    SizedBox(height: 20),
                    confimPasswordFiled,
                    SizedBox(height: 20),
                    signUpButton
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetalsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetalsToFirestore() async {
    // calling our firestore
    // calling our user model
    // calling these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();
    // waitting all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEdittingController.text;
    userModel.secondName = secondNameEdittingController.text;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: 'Account created successfull');

    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => BottomBar()), (route) => false);
  }
}
