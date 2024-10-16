import 'package:flutter/material.dart';
import 'animated_drawer_app_bar.dart'; // Make sure to import your AnimatedDrawerAppBar file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedDrawerAppBar(
        title: 'My App',
        menuItems: [
          DrawerMenuItem(
            title: 'Home',
            onTap: () {
              // Handle home tap
            },
          ),
          DrawerMenuItem(
            title: 'Settings',
            subItems: [
              DrawerMenuItem(
                title: 'Account',
                onTap: () {
                  // Handle account settings tap
                },
              ),
              DrawerMenuItem(
                title: 'Notifications',
                onTap: () {
                  // Handle notifications settings tap
                },
              ),
            ],
          ),
          DrawerMenuItem(
            title: 'About',
            onTap: () {
              // Handle about tap
            },
          ),
        ],
      ),
    );
  }
}