import 'package:flutter/material.dart';

import '../constants.dart';

class SettingIcon extends StatelessWidget {
  final IconData iconData;
  final Color backgroundColor;

  const SettingIcon({
    Key? key,
    this.iconData = Icons.backpack,
    this.backgroundColor = primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundColor,
      child: Icon(
        iconData
      ),
    );
  }
}
