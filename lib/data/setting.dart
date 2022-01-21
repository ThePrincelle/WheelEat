import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/setting_icon.dart';

abstract class Setting {
  final String title;
  final typeSetting type;
  final SettingIcon icon;
  final List<String> selectValue;
  final nameSettings name;

  const Setting({
    this.title = 'Placeholder',
    this.type = typeSetting.none,
    this.icon = const SettingIcon(),
    required this.name,
    this.selectValue = const [''],
  });

  Future loadValue() async {}

  Future<void> saveValue(newValue) async {}
}

class SettingBool extends Setting {
  bool status = false;
  SettingBool(title, name, icon)
      : super(title: title, name: name, icon: icon, type: typeSetting.bool) {
    loadValue().then((value) => status = value);
  }

  @override
  Future<bool> loadValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(
            name.toString().substring(name.toString().indexOf('.') + 1)) ??
        false;
  }

  @override
  Future<void> saveValue(newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        name.toString().substring(name.toString().indexOf('.') + 1), newValue);
    status = newValue;
  }
}

class SettingOpenner extends Setting {
  final String popupName;
  const SettingOpenner(title, name, icon, this.popupName)
      : super(title: title, name: name, icon: icon, type: typeSetting.openner);
}

class SettingSelect extends Setting {
  String selectedValue = '';
  SettingSelect(title, name, icon, List<String> selectValue)
      : super(
            title: title,
            name: name,
            icon: icon,
            selectValue: selectValue,
            type: typeSetting.select) {
    selectedValue = selectValue[selectValue.length - 1];
    loadValue().then((value) => selectedValue = value);
  }

  @override
  Future<String> loadValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(
            name.toString().substring(name.toString().indexOf('.') + 1)) ??
        selectValue[selectValue.length - 1];
  }

  @override
  Future<void> saveValue(newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        name.toString().substring(name.toString().indexOf('.') + 1), newValue);
    selectedValue = newValue;
  }
}

class SettingInt extends Setting {
  const SettingInt(title, name, icon)
      : super(title: title, name: name, icon: icon, type: typeSetting.int);

  @override
  Future<int> loadValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(
            name.toString().substring(name.toString().indexOf('.') + 1)) ??
        0;
  }

  @override
  Future<void> saveValue(newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
        name.toString().substring(name.toString().indexOf('.') + 1), newValue);
  }
}

enum typeSetting { none, bool, openner, select, int }

enum nameSettings {
  darkmode,
  blacklist,
  distance,
}

Map<nameSettings, Setting> settings = {
  nameSettings.darkmode: SettingBool(
    'Dark Mode',
    nameSettings.darkmode,
    const SettingIcon(iconData: Icons.dark_mode),
  ),
  nameSettings.blacklist: const SettingOpenner(
      'Black List',
      nameSettings.blacklist,
      SettingIcon(iconData: Icons.bug_report),
      'BlackListPopup'),
  nameSettings.distance: SettingSelect(
    'Distnace (km)',
    nameSettings.distance,
    const SettingIcon(iconData: Icons.shopping_basket_outlined),
    ['1', '10', '50', '100'],
  ),
};
