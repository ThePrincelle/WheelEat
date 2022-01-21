import './types/opening_hours.dart';
import './types/address_component.dart';
import './types/geometry.dart';
import './types/photo.dart';
import './types/plus_code.dart';

class PlaceDetails {
  // Object definition of a typical PlaceDetails response from Google Places API
  // https://developers.google.com/places/web-service/details#PlaceDetailsResults

  final List<AddressComponent>? addressComponents;
  final String? formattedAddress;
  final Geometry? geometry;
  final String? icon;
  final String? id;
  final String? name;
  final OpeningHours? openingHours;
  final List<Photo>? photos;
  final String? placeId;
  final PlusCode? plusCode;
  final double? rating;
  final String? reference;
  final String? scope;
  final List<String>? types;
  final String? url;
  final int? userRatingsTotal;
  final int? utcOffset;
  final String? vicinity;
  final String? website;

  const PlaceDetails({
    this.addressComponents,
    this.formattedAddress,
    this.geometry,
    this.icon,
    this.id,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.plusCode,
    this.rating,
    this.reference,
    this.scope,
    this.types,
    this.url,
    this.userRatingsTotal,
    this.utcOffset,
    this.vicinity,
    this.website,
  });

  // ToString debug method
  @override
  String toString() {
    return 'PlaceDetails{addressComponents: $addressComponents, formattedAddress: $formattedAddress, geometry: $geometry, icon: $icon, id: $id, name: $name, openingHours: $openingHours, photos: $photos, placeId: $placeId, plusCode: $plusCode, rating: $rating, reference: $reference, scope: $scope, types: $types, url: $url, userRatingsTotal: $userRatingsTotal, utcOffset: $utcOffset, vicinity: $vicinity, website: $website}';
  }

  // FromJson parser
  factory PlaceDetails.fromJson(Map<String, dynamic> json) {
    return PlaceDetails(
      addressComponents: json['address_components'] != null
          ? (json['address_components'] as List)
              .map((i) => AddressComponent.fromJson(i))
              .toList()
          : null,
      formattedAddress: json['formatted_address'] ?? '',
      geometry:
          json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null,
      icon: json['icon'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      openingHours: json['opening_hours'] != null
          ? OpeningHours.fromJson(json['opening_hours'])
          : null,
      photos: json['photos'] != null
          ? (json['photos'] as List).map((i) => Photo.fromJson(i)).toList()
          : null,
      placeId: json['place_id'] ?? '',
      plusCode: json['plus_code'] != null
          ? PlusCode.fromJson(json['plus_code'])
          : null,
      rating: json['rating'] ?? 0,
      reference: json['reference'] ?? '',
      scope: json['scope'] ?? '',
      types: json['types'] != null
          ? (json['types'] as List).map((type) => type as String).toList()
          : null,
      url: json['url'] ?? '',
      userRatingsTotal: json['user_ratings_total'] ?? 0,
      utcOffset: json['utc_offset'] ?? 0,
      vicinity: json['vicinity'] ?? '',
      website: json['website'] ?? '',
    );
  }
}
