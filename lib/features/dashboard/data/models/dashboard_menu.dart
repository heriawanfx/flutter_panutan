import 'package:flutter/material.dart';

class DashboardMenu {
  String label;
  Widget page;
  IconData icon;
  IconData selectedIcon;

  DashboardMenu({
    required this.label,
    required this.page,
    required this.icon,
    required this.selectedIcon,
  });
}
