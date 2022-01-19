import 'package:flutter/material.dart';

import '../constants.dart';

import '../components/setting_icon.dart';

class Setting {
  final String title;
  final bool isChecked;
  final typeSetting type;
  final String? textValue;
  final SettingIcon icon;

  const Setting({
    this.title = 'Placeholder',
    this.isChecked = false,
    this.type = typeSetting.none,
    this.textValue = '',
    this.icon = const SettingIcon(),
  });
}

enum typeSetting {
  none,
  bool,
  string,
  multichoice,
}

const List<Setting> settings = [
  Setting(
    title: 'Dark Mode',
    type: typeSetting.bool,
    icon: SettingIcon(iconData: Icons.dark_mode, backgroundColor: primaryColor,),
  ),
];
