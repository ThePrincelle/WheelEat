import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/restaurant.dart';

// Restaurant category/icon map
const Map<RestaurantCategory, IconData> restaurantCategoryIcons = {
  RestaurantCategory.none: Icons.restaurant_rounded,
  RestaurantCategory.restaurant: Icons.restaurant_rounded,
  RestaurantCategory.fastFood: Icons.fastfood_rounded,
  RestaurantCategory.pizzeria: Icons.local_pizza_rounded,
};

class CategoryIcon extends StatelessWidget {
  final RestaurantCategory category;

  const CategoryIcon({
    Key? key,
    this.category = RestaurantCategory.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: primaryColor.withOpacity(0.5),
      child: Icon(
        restaurantCategoryIcons[category] ?? Icons.restaurant_rounded,
      ),
    );
  }
}
