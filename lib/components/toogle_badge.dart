import 'package:flutter/material.dart';

import '../constants.dart';

class Toogle extends StatelessWidget {
  final bool isChecket;
  final double size;

  const Toogle(
    this.isChecket, {
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
        color: isChecket ? successColor : errorColor,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Text(
        (isChecket ? 'Activé' : 'Désactivé').toUpperCase(),
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
