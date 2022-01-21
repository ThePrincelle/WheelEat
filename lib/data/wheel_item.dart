import 'package:flutter/material.dart';

import 'restaurant.dart';

class WheelItem {
  final IconData? icon;
  final Restaurant? restaurant;
  final Color color;

  const WheelItem({this.icon, this.restaurant, required this.color});
}
