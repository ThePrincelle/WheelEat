import 'package:flutter/material.dart';

import 'home.dart';
import 'wheel.dart';
import 'settings.dart';

class PageNavigationData {
  final IconData icon;
  final String label;
  final Widget widget;

  const PageNavigationData({
    required this.icon,
    required this.label,
    required this.widget,
  });
}

const List<PageNavigationData> pagesData = [
  PageNavigationData(
    icon: Icons.home,
    label: 'Home',
    widget: HomePage(),
  ),
  PageNavigationData(
    icon: Icons.rotate_left,
    label: 'Wheel',
    widget: WheelPage(),
  ),
  PageNavigationData(
    icon: Icons.settings,
    label: 'Settings',
    widget: SettingsPage(),
  ),
];
