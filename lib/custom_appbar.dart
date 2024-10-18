import 'package:flutter/material.dart';
import '../constants.dart'; // Import the constants file

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onMenuPressed;
  final AnimationController controller; // Add AnimationController

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onMenuPressed,
    required this.controller, // Add AnimationController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: AppColors.appBarTextColor)), // Use AppColors
      backgroundColor: AppColors.appBarColor, // Use AppColors
      elevation: 0,
      leading: IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: controller, // Use AnimationController
          color: AppColors.appBarIconColor, // Use AppColors
        ),
        onPressed: onMenuPressed,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}