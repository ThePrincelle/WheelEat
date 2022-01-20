import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/setting.dart';

import 'toogle_badge.dart';
import 'select.dart';

class SettingsListTile extends StatelessWidget {
  final Setting setting;
  final bool selected;
  final VoidCallback? onTap;

  const SettingsListTile({
    Key? key,
    required this.setting,
    this.selected = false,
    this.onTap,
  }) : super(key: key);

  void setSelectValue(String newValue)
  {
    setting.saveValue(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      shadowColor: Colors.black.withOpacity(0.2),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: ListTile(
        onTap: onTap,
        selected: selected,
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
        leading: setting.icon,
        title: Text(
          setting.title.toUpperCase(),
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
        trailing: 
        Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (setting.type == typeSetting.bool)
                Toogle((setting as SettingBool).status),
              if (setting.type == typeSetting.openner)
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: textColor,
                  size: 20,
                ),
              if (setting.type == typeSetting.select)
                 Select(setting.selectValue, (setting as SettingSelect).selectedValue, setSelectValue)
            ],
        ),
        
      ),
    );
  }

}
