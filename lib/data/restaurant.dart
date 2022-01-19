class Restaurant {
  final String title;
  final RestaurantCategory category;
  final bool isOpened;
  final double? rating;
  final int? priceLevel;
  final String? address;
  final String? phone;
  final String? image;
  final Map<String, String>? schedule;

  const Restaurant({
    this.title = 'Placeholder',
    this.category = RestaurantCategory.none,
    this.isOpened = true,
    this.rating,
    this.priceLevel,
    this.address,
    this.phone,
    this.image,
    this.schedule,
  });
}

enum RestaurantCategory {
  none,
  restaurant,
  fastFood,
  pizzeria,
}
