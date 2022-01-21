import '../../data/restaurant.dart';

class RestaurantsResponse {
  final List<Restaurant>? restaurants;
  final String? address;

  RestaurantsResponse({this.restaurants, this.address});

  // ToString debug method
  @override
  String toString() {
    return 'PlacesResponse{restaurants: $restaurants, address: $address}';
  }
}
