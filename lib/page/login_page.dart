import 'package:chatapp_supabase/page/chat_page2.dart';
import 'package:chatapp_supabase/page/chat_page3.dart';
import 'package:chatapp_supabase/services/auth/auth_service.dart';
import 'package:chatapp_supabase/components/button_global.dart';
import 'package:chatapp_supabase/components/textfild_global.dart';
import 'package:chatapp_supabase/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//5
class LoginPage extends StatelessWidget {
  final TextEditingController _emailController =
      TextEditingController(text: 'test@gmail.com');
  final TextEditingController _passwordController =
      TextEditingController(text: 'password');
  LoginPage({super.key});

// login method
  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmail(
          _emailController.text, _passwordController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChatPage2()),
      );
    }

    // catch any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
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
              "Welcome back, you've been missed!",
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
            // login button
            ButtonGlobal(
              text: 'Login',
              onTap: () => login(context),
            ),
            SizedBox(height: 15.h),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style: TextStyle(color: theme.colorScheme.primary),
                ), // Text
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/register'),
                  child: Text(
                    "Register now",
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
