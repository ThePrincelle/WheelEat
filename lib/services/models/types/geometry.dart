import './location.dart';
import './viewport.dart';

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
