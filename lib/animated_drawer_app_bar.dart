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
  late Animation<double> _animation;
  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // Increased duration for smoother animation
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic, // Using a more sophisticated curve
    );
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
            progress: _animation,
          ),
          onPressed: _toggleDrawer,
        ),
      ),
      body: Stack(
        children: [
          // Your main content goes here
          Center(child: Text('Main Content')),

          // Animated Drawer
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                width: MediaQuery.of(context).size.width * 0.7,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(
                      -MediaQuery.of(context).size.width * 0.7 * (1 - _animation.value),
                      -MediaQuery.of(context).size.height * 0.3 * (1 - _animation.value),
                    )
                    ..scale(_animation.value, _animation.value),
                  alignment: Alignment.topLeft,
                  child: Drawer(
                    child: ListView(
                      children: [
                        DrawerHeader(
                          child: Text('Menu'),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                          ),
                        ),
                        ...widget.menuItems.map((item) => _buildMenuItem(item)).toList(),
                      ],
                    ),
                  ),
                ),
              );
            },
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