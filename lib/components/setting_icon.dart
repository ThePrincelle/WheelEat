import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/setting.dart';

class SettingIcon extends StatelessWidget {
  final IconData iconData;

  const SettingIcon({
    Key? key,
    this.iconData = Icons.backpack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: primaryColor.withOpacity(0.5),
      child: Icon(
        iconData
      ),
    );
  }
}
