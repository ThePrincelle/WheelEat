import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

import '../components/setting_icon.dart';

class Setting {
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
    this.selectValue = const[''],
  });

  Future<bool> getBoolValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(name.toString())??false;
  }

  Future<void> setBoolValue(newValue) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setBool(name.toString(),newValue);
  }

  Future<int> getIntValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(name.toString())??0;
  }

  Future<void> setIntValue(newValue) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setInt(name.toString(),newValue);
  }

  Future<String> getStringValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(name.toString())??'';
  }

  Future<void> setStringValue(newValue) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.setString(name.toString(),newValue);
  }
}

enum typeSetting {
  none,
  bool,
  openner,
  select
}

enum nameSettings {
  darkmode,
  blacklist,
  distance,
}

const Map<nameSettings,Setting> settings = {
  nameSettings.darkmode: Setting(
    title: 'Dark Mode',
    type: typeSetting.bool,
    icon: SettingIcon(iconData: Icons.dark_mode),
    name:  nameSettings.darkmode,
  ),

  nameSettings.blacklist: Setting(
    title: 'Black List',
    type: typeSetting.openner,
    icon: SettingIcon(iconData: Icons.bug_report),
    name:  nameSettings.blacklist,
  ),

  nameSettings.distance: Setting(
    title: 'Distnace (km)',
    type: typeSetting.select,
    icon: SettingIcon(iconData: Icons.shopping_basket_outlined),
    selectValue: ['1','10','50','100'],
    name:  nameSettings.distance,
  ),


};
