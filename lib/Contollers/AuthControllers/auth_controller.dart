// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class AuthProvider extends ChangeNotifier {
//   GoogleSignInAccount? _user;
//   GoogleSignInAccount get user => _user!;
//
//   Future googleSignIn() async {
//     final googleUser = await GoogleSignIn().signIn();
//     if (googleUser == null) return;
//     _user = googleUser;
//     final googleAuth = await googleUser.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//   }
//
//   // UserCredential? userCredential;
//   //
//   // Future signInWithGoogle() async {
//   //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//   //   final GoogleSignInAuthentication? googleAuth =
//   //       await googleUser?.authentication;
//   //   final credential = GoogleAuthProvider.credential(
//   //     accessToken: googleAuth?.accessToken,
//   //     idToken: googleAuth?.idToken,
//   //   );
//   //   userCredential =
//   //       await FirebaseAuth.instance.signInWithCredential(credential);
//   //   notifyListeners();
//   // }
// }
