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
                itemBuilder: (build, index) => SettingsListTile(
                  setting: settings.values.toList()[index],
                ),
                separatorBuilder: (_, index) =>
                    const SizedBox(height: defaultPadding / 2),
              ),
            ),
            const Text(
              "Les fonctionnalités de cette page seront développées ultérieurement.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: defaultPadding * 2),
          ],
        ),
      ),
    );
  }
}
