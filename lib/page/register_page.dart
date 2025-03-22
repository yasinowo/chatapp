import 'package:emailapp/components/button_global.dart';
import 'package:emailapp/components/textfild_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  RegisterPage({super.key});

  //register method
  void register() {}
  //push to login page

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
            ButtonGlobal(text: 'Register', onTap: register),
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
