import 'package:flutter/material.dart';

import '../constants.dart';

class RatingStars extends StatelessWidget {
  final double? rating;
  final double size;

  const RatingStars(
    this.rating, {
    Key? key,
    this.size = defaultPadding / 1.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding / 2,
        vertical: defaultPadding / 4,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Row(
        children: [
          Text(
            rating?.toString() ?? '—',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: size,
            ),
          ),
          const Icon(Icons.star, color: textColor, size: 14)
        ],
      ),
    );
  }
}
