import 'package:flutter/material.dart';

import '../constants.dart';

class OpenedClosedBadge extends StatelessWidget {
  final bool isOpened;
  final double size;

  const OpenedClosedBadge(
    this.isOpened, {
    Key? key,
    this.size = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        defaultPadding / 2,
        defaultPadding / 3,
        defaultPadding / 2,
        defaultPadding / 4,
      ),
      decoration: BoxDecoration(
        color: isOpened ? successColor : errorColor,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Text(
        (isOpened ? 'Ouvert' : 'Fermé').toUpperCase(),
        style: TextStyle(
          color: lightTextColor,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w900,
          fontSize: size,
        ),
      ),
    );
  }
}
