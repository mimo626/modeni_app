import 'package:flutter/cupertino.dart';

class NavItem {
  final Icon icon;
  final Icon activeIcon;
  final String label;

  const NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}