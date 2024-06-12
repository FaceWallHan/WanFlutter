import 'package:flutter/material.dart';

/// 侧滑列表Item
class DrawerItem {
  String label;
  IconData icon;
  VoidCallback? onPressed;

  DrawerItem(this.label, this.icon, this.onPressed);
}
