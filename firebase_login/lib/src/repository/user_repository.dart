import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

// class UserRepository {
//   final FirebaseAuth _firebaseAuth;
//   final GoogleSignIn _googleSignIn;
//
//   UserRepository(
//       {required FirebaseAuth firebaseAuth, required GoogleSignIn googleSignIn})
//       :
//         _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
//         _googleSignIn = googleSignIn ?? GoogleSignIn();
//
//   Future<void> signInWithEmailAndPassword(String email, String password) async {
//     return await _firebaseAuth.signInWithEmailAndPassword(
//         email: email, password: password).then((uid) => {
//           Fluttertoast.showToast(msg: "Login Successfull")
//     });
//   }
// }