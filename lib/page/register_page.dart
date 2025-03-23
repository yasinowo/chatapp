import 'package:chatapp_supabase/auth/auth_service.dart';
import 'package:chatapp_supabase/components/button_global.dart';
import 'package:chatapp_supabase/components/textfild_global.dart';
import 'package:chatapp_supabase/page/home_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController =
      TextEditingController(text: 'yasinforcollege@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: 'password');
  final TextEditingController _confirmPasswordController =
      TextEditingController(text: 'password');
  RegisterPage({super.key});

// register method
  void register(BuildContext context) {
    // get auth service
    final _auth = AuthService();

    // passwords match -> create user
    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        _auth.signUpWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ), // AlertDialog
        );
      }
    }
    // passwords dont match -> tell user to fix
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match!"),
        ), // AlertDialog
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60, //dont forget utillscreen
              color: Theme.of(context).colorScheme.primary,
            ), // Icon
            SizedBox(height: 50.h),
            // welcome back message
            Text(
              "Lets create an account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ), // TextStyle
            ), // Text
            SizedBox(height: 25.h),
            // email textfield
            TextFieldGlobal(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
            ),
            SizedBox(height: 15.h),
            // pw textfield
            TextFieldGlobal(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordController,
            ),
            SizedBox(height: 15.h),
            TextFieldGlobal(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _confirmPasswordController,
            ),
            SizedBox(height: 15.h),
            // login button
            ButtonGlobal(text: 'Register', onTap: () => register(context)),
            SizedBox(height: 15.h),
            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(color: theme.colorScheme.primary),
                ), // Text
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/login'),
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ), // TextStyle
                  ),
                ), // Text
              ],
            ), // Row
          ],
        ), // Column
      ),
    );
  }
}
