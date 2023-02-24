import 'package:flutter/material.dart';

/// Custom bottom bavigation item
class BottomNavBarItem extends BottomNavigationBarItem {
  const BottomNavBarItem(
      {required this.path,
      required this.title,
      required Icon icon,
      String? label})
      : super(
          icon: icon,
          label: label,
        );

  final String path;
  final String title;
}
