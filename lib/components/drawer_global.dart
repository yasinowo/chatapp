import 'package:chatapp_supabase/services/auth/auth_service.dart';
import 'package:chatapp_supabase/page/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerGlobal extends StatelessWidget {
  const DrawerGlobal({super.key});
  void logout(BuildContext context) {
    // get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40.sp,
                  ), // Icon
                ), // Center
              ),
              // home list tile
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: ListTile(
                  title: Text(
                    "H O M E",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.primary,
                    size: 25.sp,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ), // ListTile
              ), // Padding

              // settings list tile
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: ListTile(
                  title: Text(
                    "S E T T I N G S",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  leading: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.primary,
                    size: 25.sp,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingPage()));
                  },
                ), // ListTile
              ), // Padding
            ],
          ),
          // logout list tile
          Padding(
            padding: EdgeInsets.only(left: 20.w, bottom: 20.h),
            child: ListTile(
              title: Text(
                "L O G O U T",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
              leading: Icon(
                Icons.logout,
                color: Theme.of(context).colorScheme.primary,
                size: 25.sp,
              ),
              onTap: () {
                Navigator.pop(context);
                logout(context);
              },
            ), // ListTile
          ), // Padding
        ],
      ), // Column
    ); // Drawer
  }
}
