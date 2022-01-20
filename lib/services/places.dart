import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import './models/place.dart';

import '../data/restaurant.dart';

final googleApiKey = dotenv.env['GOOGLE_API_KEY'] ?? '';

class Places {
  // A function that returns a list of places with a given keyword.
  Future<List<dynamic>> getPlacesFromCoordinates(
      String latitude, String longitude,
      [String? address]) async {
    // Fetch Google Places API data by coordinates with given type and language
    final Uri uri =
        Uri.https("maps.googleapis.com", "/maps/api/place/nearbysearch/json", {
      "location": "$latitude,$longitude",
      "type": "restaurant",
      "language": "fr",
      "rankby": "distance",
      "key": googleApiKey
    });

    final response = await http.get(uri);

    // Decode the JSON response
    var results = json.decode(response.body)["results"];
    // For each result, parse the JSON and create a new Place object.
    var places = results.map<Place>((json) => Place.fromJson(json)).toList();

    // Map the results to a list of Restaurant objects
    final restaurants =
        places.map<Restaurant>((data) => Restaurant.fromPlace(data)).toList();

    // For each restaurant, print the toString.
    restaurants.forEach((restaurant) => print(restaurant.toString()));

    return restaurants;
  }

  // A function that returns a list of places with a given address.
  Future<List<dynamic>> getPlacesFromAddress(String address) async {
    // If address is defined, continue, else return empty list
    if (address != "") {
      // Get address coordinates with Google API
      final Uri uri = Uri.https("maps.googleapis.com", "/maps/api/geocode/json",
          {"address": address, "language": "fr", "key": googleApiKey});

      final response = await http.get(uri);
      var results = json.decode(response.body)["results"];
      if (results.length > 0) {
        // Get first result from results
        var result = results[0];
        // Get coordinates from first result
        var coordinates = result["geometry"]["location"];
        // Get latitude and longitude from coordinates
        var latitude = coordinates["lat"].toString();
        var longitude = coordinates["lng"].toString();
        // Get places from coordinates
        return getPlacesFromCoordinates(latitude, longitude, address);
      } else {
        return [];
      }
    } else {
      return [];
    }
  }
}

// Get details from placeId
Future<dynamic> getPlaceDetails(Restaurant restaurant) async {
  if (restaurant.placeId != "") {
    // Fetch Google Places API data by placeId
    final Uri uri = Uri.https(
        "maps.googleapis.com",
        "/maps/api/place/details/json",
        {"placeid": restaurant.placeId, "language": "fr", "key": googleApiKey});

    final response = await http.get(uri);

    // Decode the JSON response
    var result = json.decode(response.body)["result"];

    return result;
  } else {
    return null;
  }
}
