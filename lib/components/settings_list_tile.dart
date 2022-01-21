import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/setting.dart';
import 'toogle_badge.dart';
import 'select.dart';

class SettingsListTile extends StatefulWidget {
  final Setting setting;
  final bool selected;

  const SettingsListTile({
    Key? key,
    required this.setting,
    this.selected = false,
  }) : super(key: key);

  @override
  State<SettingsListTile> createState() => _SettingsListTileState();
}

class _SettingsListTileState extends State<SettingsListTile> {
  bool _boolValue = false;

  void setSelectValue(String newValue) {
    widget.setting.saveValue(newValue);
  }

  @override
  void initState() {
    if (widget.setting.type == typeSetting.bool) {
      setState(() {
        _boolValue = (widget.setting as SettingBool).status;
      });
    }
    super.initState();
  }

  void onTapBoolSettings() {
    var newStatus = !(widget.setting as SettingBool).status;
    widget.setting.saveValue(newStatus);
    setState(() {
      _boolValue = newStatus;
    });
  }

  void onTapOpennerSettings() {
    //Todo: Ouverture de La popup inscrite dans le settings
    //setState(() { _boolValue = (widget.setting as SettingBool).status; });
  }

  void onTapSelectSettings() {
    //setState(() { _boolValue = (widget.setting as SettingBool).status; });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      shadowColor: Colors.black.withOpacity(0.2),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: ListTile(
        onTap: () {
          switch (widget.setting.type) {
            case typeSetting.bool:
              onTapBoolSettings();
              break;

            case typeSetting.openner:
              onTapOpennerSettings();
              break;

            case typeSetting.select:
              onTapSelectSettings();
              break;

            default:
              break;
          }
        },
        selected: widget.selected,
        selectedColor: textColor,
        selectedTileColor: primaryColor.withOpacity(0.3),
        hoverColor: primaryColor.withOpacity(0.4),
        horizontalTitleGap: defaultPadding,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding / 2,
        ),
        tileColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        leading: widget.setting.icon,
        title: Text(
          widget.setting.title.toUpperCase(),
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.setting.type == typeSetting.bool) Toogle(_boolValue),
            if (widget.setting.type == typeSetting.openner)
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: textColor,
                size: 20,
              ),
            if (widget.setting.type == typeSetting.select)
              Select(
                  widget.setting.selectValue,
                  (widget.setting as SettingSelect).selectedValue,
                  setSelectValue)
          ],
        ),
      ),
    );
  }
}
