// lib/widgets/expandable_tile.dart
import 'package:flutter/material.dart';

class ExpandableTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Map<String, String>> subItems;

  const ExpandableTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Icon(icon, color: Colors.blue[600], size: 28),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          children: subItems.map((subItem) {
            return ListTile(
              contentPadding: EdgeInsets.only(left: 72, right: 16),
              title: Text(
                subItem['title']!,
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, subItem['route']!);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}