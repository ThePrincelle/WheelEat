import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final googleApiKey = dotenv.env['GOOGLE_API_KEY'] ?? '';

const List<String> defaultType = ["restaurant"];
const double doubleZero = 0.0;

class Place {
  // Object based on Place from Google Maps API

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
      priceLevel: parseInt(json['price_level']?.toString()) ?? 0,
      rating: parseDouble(json['rating']?.toString()) ?? doubleZero,
      reference: json['reference'],
      scope: json['scope'],
      phone: json['formatted_phone_number'],
      types: (json['types'] as List).map((type) => type as String).toList(),
      userRatingsTotal: json['user_ratings_total'] ?? 0,
      vicinity: json['vicinity'],
    );
  }
}

double? parseDouble(String? value) {
  if (value == null) {
    return null;
  }
  return double.parse(value);
}

int? parseInt(String? value) {
  if (value == null) {
    return null;
  }
  return int.parse(value);
}

// ignore: constant_identifier_names
enum BusinessStatus { OPERATIONAL, CLOSED_TEMPORARILY, CLOSED_PERMANENTLY }
final Map<String, BusinessStatus> businessStatusMapping = {
  "OPERATIONAL": BusinessStatus.OPERATIONAL,
  "CLOSED_TEMPORARILY": BusinessStatus.CLOSED_TEMPORARILY,
  "CLOSED_PERMANENTLY": BusinessStatus.CLOSED_PERMANENTLY
};

class OpeningHours {
  final bool openNow;

  const OpeningHours({
    this.openNow = false,
  });

  // ToString debug method
  @override
  String toString() {
    return 'OpeningHours{openNow: $openNow}';
  }

  // FromJson parser
  factory OpeningHours.fromJson(Map<String, dynamic> json) {
    return OpeningHours(
      openNow: json['open_now'],
    );
  }
}

class Photo {
  final int height;
  final List<dynamic>? htmlAttributions;
  final String? photoReference;
  final int width;
  final Uri? uri;

  const Photo(
      {this.height = 0,
      this.htmlAttributions,
      this.photoReference = "",
      this.width = 0,
      this.uri});

  // ToString debug method
  @override
  String toString() {
    return 'Photo{height: $height, htmlAttributions: $htmlAttributions, photoReference: $photoReference, width: $width, uri: ${uri.toString()}}';
  }

  // FromJson parser
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
        height: json['height'],
        htmlAttributions: json['html_attributions'] != null
            ? json['html_attributions']
            : null,
        photoReference: json['photo_reference'],
        width: json['width'],

        // https://maps.googleapis.com/maps/api/place/photo?maxwidth=1000&photo_reference=photo_reference&key=YOUR_API_KEY
        uri: json['photo_reference'] != null
            ? Uri.https("maps.googleapis.com", "maps/api/place/photo", {
                "photo_reference": json['photo_reference'],
                "maxwidth": "1000",
                "key": googleApiKey
              })
            : null);
  }
}

class PlusCode {
  final String compoundCode;
  final String globalCode;

  const PlusCode({
    this.compoundCode = "",
    this.globalCode = "",
  });

  // ToString debug method
  @override
  String toString() {
    return 'PlusCode{compoundCode: $compoundCode, globalCode: $globalCode}';
  }

  // FromJson parser
  factory PlusCode.fromJson(Map<String, dynamic> json) {
    return PlusCode(
      compoundCode: json['compound_code'],
      globalCode: json['global_code'],
    );
  }
}

class Geometry {
  final Location location;
  final Viewport viewport;

  const Geometry({
    this.location = const Location(),
    this.viewport = const Viewport(),
  });

  // ToString debug method
  @override
  String toString() {
    return 'Geometry{location: $location, viewport: $viewport}';
  }

  // FromJson parser
  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      location: Location.fromJson(json['location']),
      viewport: Viewport.fromJson(json['viewport']),
    );
  }
}

class Location {
  final double lat;
  final double lng;

  const Location({
    this.lat = 0.0,
    this.lng = 0.0,
  });

  // ToString debug method
  @override
  String toString() {
    return 'Location{lat: $lat, lng: $lng}';
  }

  // FromJson parser
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}

class Viewport {
  final Location northeast;
  final Location southwest;

  const Viewport({
    this.northeast = const Location(),
    this.southwest = const Location(),
  });

  // ToString debug method
  @override
  String toString() {
    return 'Viewport{northeast: $northeast, southwest: $southwest}';
  }

  // FromJson parser
  factory Viewport.fromJson(Map<String, dynamic> json) {
    return Viewport(
      northeast: Location.fromJson(json['northeast']),
      southwest: Location.fromJson(json['southwest']),
    );
  }
}
