import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300), // Reduced duration
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, -1.0),
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
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
          ),
          onPressed: _toggleDrawer,
        ),
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
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      child: Text('Menu', style: TextStyle(color: Colors.white)),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                    ...widget.menuItems.map((item) => _buildMenuItem(item)).toList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(DrawerMenuItem item) {
    if (item.subItems.isEmpty) {
      return ListTile(
        title: Text(item.title),
        onTap: item.onTap,
      );
    } else {
      return ExpansionTile(
        title: Text(item.title),
        children: item.subItems.map((subItem) => _buildMenuItem(subItem)).toList(),
      );
    }
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