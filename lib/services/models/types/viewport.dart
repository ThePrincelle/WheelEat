import './location.dart';

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
