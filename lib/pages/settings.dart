import 'package:flutter/material.dart';
import '../data/setting.dart';

import '../constants.dart';

import '../components/page_title.dart';
import '../components/settings_list_tile.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultPadding * 4),
            const PageTitle('Settings,'),
            const SizedBox(height: defaultPadding * 2),
            Expanded(
              child: ListView.separated(
                itemCount: settings.length,
                itemBuilder: (_, index) => SettingsListTile(
                  setting: settings.values.toList()[index],
                  onTap: () {
                    if (settings.values.toList()[index].type == typeSetting.bool) {
                      var setting = settings.values.toList()[index] as SettingBool;
                      setting.saveValue(!setting.status);
                    }
                    if (settings.values.toList()[index].type == typeSetting.openner) {

                      //Todo: Ouverture de La popup inscrite dans le settings
                    }
                  },
                ),
                separatorBuilder: (_, index) =>
                    const SizedBox(height: defaultPadding / 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
