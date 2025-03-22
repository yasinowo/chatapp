import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //firebase.auth().settings.appVerificationDisabledForTesting = true;

  // sign in
  // Future<User?> loginUserWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     final cred = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     return cred.user;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
  Future<UserCredential> signInWithEmailAndPassword(
      String email, password) async {
    // _auth.setSettings(
    //   appVerificationDisabledForTesting: false,
    // );
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  // sign up

  // sign out

  // errors
}
