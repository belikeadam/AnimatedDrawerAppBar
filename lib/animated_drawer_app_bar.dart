import 'package:animateddrawerappbar/constants.dart';
import 'package:animateddrawerappbar/expandable_tile.dart';
import 'package:animateddrawerappbar/text_styles.dart';
import 'package:animateddrawerappbar/version_control.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:animateddrawerappbar/custom_appbar.dart'; // Import CustomAppBar

class AnimatedDrawerAppBar extends StatefulWidget {
  final String title;
  final List<DrawerMenuItem> menuItems;

  const AnimatedDrawerAppBar({
    Key? key,
    required this.title,
    required this.menuItems,
  }) : super(key: key);

  @override
  _AnimatedDrawerAppBarState createState() => _AnimatedDrawerAppBarState();
}

class _AnimatedDrawerAppBarState extends State<AnimatedDrawerAppBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  bool _isDrawerOpen = false;
  bool _isLoading = true;
  final String lastLoginTime = '12:00PM -- 01/01/2023';
  final String username = 'HardcodedUser';
  final String userRole = 'Admin';
  final String agentId = '12345';
  final String agentName = 'Hardcoded Agent';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    ));
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    ));

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
      if (_isDrawerOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        onMenuPressed: _toggleDrawer,
        controller: _controller, // Pass AnimationController
      ),
      body: Stack(
        children: [
          Center(child: Text('Main Content')),
          SlideTransition(
            position: _slideAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              alignment: Alignment.topLeft,
              child: Drawer(
                child: SafeArea(
                  child: Container(
                    color: AppColors.backgroundColor,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              _buildHeader(context),
                              const SizedBox(height: 20),
                              _isLoading ? _buildSkeletonMenuItems() : _buildAnimatedMenuItems(context),
                              Divider(color: AppColors.secondaryTextColor, thickness: 1),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _buildLogoutButton(context),
                            const SizedBox(height: 20),
                            _buildVersionInfo(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primaryColor, AppColors.primaryVariantColor],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.onPrimaryColor.withOpacity(0.9),
                child: Text(
                  username.isNotEmpty ? username[0] : '',
                  style: AppTextStyles.cardTitle.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username: $username',
                      style: AppTextStyles.body2.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.onPrimaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Role: $userRole',
                      style: AppTextStyles.supplierName.copyWith(
                        color: AppColors.onPrimaryColor,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Agent ID: $agentId',
                      style: AppTextStyles.supplierName.copyWith(
                        color: AppColors.onPrimaryColor,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Agent Name: $agentName',
                      style: AppTextStyles.supplierName.copyWith(
                        color: AppColors.onPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Logged in: $lastLoginTime',
                style: AppTextStyles.supplierName.copyWith(
                  color: AppColors.onPrimaryColor.withOpacity(0.9),
                ),
              ),
              IconButton(
                icon: Icon(Icons.settings, color: AppColors.onPrimaryColor),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedMenuItems(BuildContext context) {
    final menuItems = [
      {'icon': Icons.dashboard, 'title': 'Dashboard', 'route': '/dashboard'},
    ];
    return Column(
      children: List.generate(menuItems.length, (index) {
        return TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(milliseconds: 200 + (index * 100)),
          builder: (context, double value, child) {
            return Transform.translate(
              offset: Offset(0, 50 * (1 - value)),
              child: Opacity(
                opacity: value,
                child: child,
              ),
            );
          },
          child: menuItems[index].containsKey('subItems')
              ? ExpandableTile(
            icon: menuItems[index]['icon'] as IconData,
            title: menuItems[index]['title'] as String,
            subItems: menuItems[index]['subItems'] as List<Map<String, String>>,
          )
              : _buildMenuItem(
            context,
            menuItems[index]['icon'] as IconData,
            menuItems[index]['title'] as String,
            menuItems[index]['route'] as String,
          ),
        );
      }),
    );
  }

  Widget _buildSkeletonMenuItems() {
    final menuItems = [
      {'icon': Icons.dashboard, 'title': 'Dashboard', 'route': '/dashboard'},
    ];
    if (menuItems.length < 5) {
      return _buildAnimatedMenuItems(context);
    }

    return Column(
      children: List.generate(8, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Skeletonizer(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(Icons.circle, color: AppColors.primaryColor, size: 28),
                title: Container(
                  width: 100,
                  height: 16,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, String route) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryColor, size: 28),
        title: Text(
          title,
          style: AppTextStyles.cardLabel.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.exit_to_app, color: AppColors.onErrorColor),
        label: Text('Logout', style: AppTextStyles.button.copyWith(color: AppColors.onErrorColor)),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.errorColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/');
        },
      ),
    );
  }

  Widget _buildVersionInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        '${VersionController.Ver}',
        textAlign: TextAlign.center,
        style: AppTextStyles.caption.copyWith(color: AppColors.secondaryTextColor),
      ),
    );
  }
}

class DrawerMenuItem {
  final String title;
  final VoidCallback? onTap;
  final List<DrawerMenuItem> subItems;

  DrawerMenuItem({
    required this.title,
    this.onTap,
    this.subItems = const [],
  });
}