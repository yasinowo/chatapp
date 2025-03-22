import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('data'));

    // Scaffold(
    //   body: StreamBuilder(
    //     stream: FirebaseAuth.instance.authStateChanges(),
    //     builder: (context, snapshot) {
    //       // user is logged in
    //       if (snapshot.hasData) {
    //         return const HomePage();
    //       }
    //       // user is NOT logged in
    //       else {
    //         return LoginPage();
    //       }
    //     }, // StreamBuilder
    //   ), // Scaffold
    // );
  }
}
