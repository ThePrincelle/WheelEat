import 'package:flutter/material.dart';

import '../constants.dart';

class PriceTags extends StatelessWidget {
  final int priceLevel;
  final double size;

  const PriceTags(
    this.priceLevel, {
    Key? key,
    this.size = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.monetization_on_outlined,
          color: priceLevel > 1 ? successColor : Colors.black.withOpacity(0.3),
          size: size,
        ),
        Icon(
          Icons.monetization_on_outlined,
          color: priceLevel > 2 ? successColor : Colors.black.withOpacity(0.3),
          size: size,
        ),
        Icon(
          Icons.monetization_on_outlined,
          color: priceLevel > 3 ? successColor : Colors.black.withOpacity(0.3),
          size: size,
        ),
      ],
    );
  }
}
