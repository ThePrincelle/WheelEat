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
