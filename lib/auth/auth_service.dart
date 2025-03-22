import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  // instance of auth
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  //firebase.auth().settings.appVerificationDisabledForTesting = true;

  // sign in
  Future<void> signInWithEmail(String email, String password) async {
    try {
      final response = await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        print('ورود موفقیت‌آمیز: ${response.user!.email}');
      }
    } catch (error) {
      print('خطا در ورود: $error');
    }
  }

  // Future<UserCredential> signInWithEmailAndPassword(
  //     String email, password) async {
  //   // _auth.setSettings(
  //   //   appVerificationDisabledForTesting: false,
  //   // );
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     return userCredential;
  //   } on FirebaseAuthException catch (e) {
  //     throw Exception(e);
  //   }
  // }

  // sign up

  // sign out

  // errors
}
