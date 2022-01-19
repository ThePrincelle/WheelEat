import 'package:flutter/material.dart';

import '../constants.dart';

class PageTitle extends StatelessWidget {
  final String title;

  const PageTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: defaultPadding * 2,
          ),
        ),
        Row(
          children: const [
            Text(
              'WHEEL',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: defaultPadding * 2,
              ),
            ),
            Text(
              'EAT',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: primaryColor,
                fontSize: defaultPadding * 2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
