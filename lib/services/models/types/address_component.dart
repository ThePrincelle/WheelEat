class AddressComponent {
  // Object definition of address_components
  // Example: { "long_name": "48", "short_name": "48", "types": ["street_number"] }
  final String? longName;
  final String? shortName;
  final List<String>? types;

  const AddressComponent({
    this.longName,
    this.shortName,
    this.types,
  });

  // FromJson parser
  factory AddressComponent.fromJson(Map<String, dynamic> json) {
    return AddressComponent(
      longName: json['long_name'] ?? '',
      shortName: json['short_name'] ?? '',
      types: json['types'] != null
          ? List<String>.from(json['types'].map((x) => x))
          : null,
    );
  }

  // ToString debug method
  @override
  String toString() {
    return 'AddressComponent{longName: $longName, shortName: $shortName, types: $types}';
  }
}
