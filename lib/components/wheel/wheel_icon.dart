import 'package:flutter/material.dart';

import '../../data/wheel_item.dart';

class WheelIcon extends StatelessWidget {
  final WheelItem item;
  final double size;
  final double padding;

  const WheelIcon(
    this.item, {
    Key? key,
    this.size = 24.0,
    this.padding = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Icon(
          item.icon,
          color: Colors.black45,
          size: size,
        ),
      ),
    );
  }
}
