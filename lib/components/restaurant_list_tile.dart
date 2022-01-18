import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/restaurant.dart';

import 'opened_closed_badge.dart';
import 'price_tags.dart';
import 'rating_stars.dart';
import 'category_icon.dart';

class RestaurantListTile extends StatelessWidget {
  final Restaurant restaurant;
  final bool selected;
  final VoidCallback? onTap;

  const RestaurantListTile({
    Key? key,
    this.restaurant = const Restaurant(title: 'Placeholder'),
    this.selected = false,
    this.onTap,
  }) : super(key: key);

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
        leading: CategoryIcon(category: restaurant.category),
        title: Text(
          restaurant.title.toUpperCase(),
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
          child: Row(
            children: [
              OpenedClosedBadge(restaurant.isOpened),
              const Spacer(),
              if (restaurant.priceLevel != null)
                PriceTags(restaurant.priceLevel!),
              const SizedBox(width: defaultPadding / 4),
              RatingStars(restaurant.rating),
            ],
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: textColor,
          size: 20,
        ),
      ),
    );
  }
}
