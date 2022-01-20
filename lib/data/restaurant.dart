import 'package:wheeleat/services/models/place.dart';

class Restaurant {
  final String title;
  final RestaurantCategory category;
  final bool isOpened;
  final double? rating;
  final int? priceLevel;
  final String? address;
  final String? phone;
  final String? icon;
  final String? iconBackgroundColor;
  final String? image;
  final String? type;
  final Map<String, String>? schedule;
  final String placeId;

  const Restaurant({
    this.title = 'Placeholder',
    this.category = RestaurantCategory.none,
    this.isOpened = true,
    this.rating,
    this.priceLevel,
    this.address,
    this.phone,
    this.image,
    this.icon,
    this.iconBackgroundColor,
    this.type,
    this.schedule,
    this.placeId = '',
  });

  // To String method for debugging
  @override
  String toString() {
    return 'Restaurant{title: $title, category: $category, isOpened: $isOpened, rating: $rating, priceLevel: $priceLevel, address: $address, phone: $phone, image: $image, icon: $icon, type: $type, schedule: $schedule, placeId: $placeId}';
  }

  // Map from Place object
  factory Restaurant.fromPlace(Place place) {
    return Restaurant(
      title: place.name,
      isOpened: place.openingHours.openNow,
      rating: place.rating,
      priceLevel: place.priceLevel,
      address: place.vicinity,
      phone: place.phone,
      icon: place.icon,
      iconBackgroundColor: place.iconBackgroundColor,
      image: place.photos?[0].uri.toString(),
      type: place.types[0],
      placeId: place.placeId,
      // schedule: place.schedule,
    );
  }
}

enum RestaurantCategory {
  none,
  restaurant,
  fastFood,
  pizzeria,
}
