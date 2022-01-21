import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../utils/parsing.dart';

import './types/business_status.dart';
import './types/opening_hours.dart';
import './types/photo.dart';
import './types/plus_code.dart';
import './types/geometry.dart';

final googleApiKey = dotenv.env['GOOGLE_API_KEY'] ??
    const String.fromEnvironment('GOOGLE_API_KEY', defaultValue: '');

const List<String> defaultType = ["restaurant"];
const double doubleZero = 0.0;

class Place {
  // Object based on Place from Google Maps API
  // https://developers.google.com/places/web-service/details#PlaceDetails

  final BusinessStatus businessStatus;
  final Geometry geometry;
  final String? icon;
  final String? iconBackgroundColor;
  final String? iconMaskBaseUri;
  final String name;
  final OpeningHours openingHours;
  final List<Photo>? photos;
  final String placeId;
  final PlusCode? plusCode;
  final int? priceLevel;
  final double? rating;
  final String? reference;
  final String? scope;
  final String? phone;
  final List<String> types;
  final int userRatingsTotal;
  final String vicinity;

  const Place({
    this.businessStatus = BusinessStatus.OPERATIONAL,
    this.geometry = const Geometry(),
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.name = "",
    this.openingHours = const OpeningHours(),
    this.photos,
    this.placeId = "",
    this.plusCode,
    this.priceLevel,
    this.rating,
    this.reference,
    this.scope,
    this.phone,
    this.types = defaultType,
    this.userRatingsTotal = 0,
    this.vicinity = "",
  });

  // ToString debug method
  @override
  String toString() {
    return 'Place{businessStatus: $businessStatus, geometry: ${geometry.toString()}, icon: $icon, iconBackgroundColor: $iconBackgroundColor, iconMaskBaseUri: $iconMaskBaseUri, name: $name, openingHours: ${openingHours.toString()}, photos: ${photos?.map((photo) => photo.toString())}, placeId: $placeId, plusCode: ${plusCode.toString()}, priceLevel: $priceLevel, rating: $rating, reference: $reference, scope: $scope, phone: $phone, types: $types, userRatingsTotal: $userRatingsTotal, vicinity: $vicinity}';
  }

  // FromJson parser
  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      businessStatus: json['business_status'] != null
          ? businessStatusMapping[json['businessStatus']] ??
              BusinessStatus.OPERATIONAL
          : BusinessStatus.OPERATIONAL,
      geometry: Geometry.fromJson(json['geometry']),
      icon: json['icon'],
      iconBackgroundColor: json['icon_background_color'],
      iconMaskBaseUri: json['icon_mask_base_uri'],
      name: json['name'],
      openingHours: json['opening_hours'] != null
          ? OpeningHours.fromJson(json['opening_hours'])
          : const OpeningHours(),
      photos: json['photos'] != null
          ? (json['photos'] as List)
              .map((photo) => Photo.fromJson(photo))
              .toList()
          : null,
      placeId: json['place_id'],
      plusCode: json['plus_code'] != null
          ? PlusCode.fromJson(json['plus_code'])
          : null,
      priceLevel: parseInt(json['price_level']?.toString()),
      rating: parseDouble(json['rating']?.toString()),
      reference: json['reference'],
      scope: json['scope'],
      phone: json['formatted_phone_number'],
      types: (json['types'] as List).map((type) => type as String).toList(),
      userRatingsTotal: json['user_ratings_total'] ?? 0,
      vicinity: json['vicinity'],
    );
  }
}
