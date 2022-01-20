import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import './models/place.dart';
import './models/place_details.dart';

import '../data/restaurant.dart';

import './models/restaurants_response.dart';

final googleApiKey = dotenv.env['GOOGLE_API_KEY'] ?? '';

class Places {
  // A function that returns a list of places with a given keyword.
  Future<RestaurantsResponse> getPlacesFromCoordinates(
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

    final response = await http.get(uri, headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });

    // Decode the JSON response
    var results = json.decode(response.body)["results"];
    // For each result, parse the JSON and create a new Place object.
    var places = results.map<Place>((json) => Place.fromJson(json)).toList();

    // Map the results to a list of Restaurant objects
    final restaurants =
        places.map<Restaurant>((data) => Restaurant.fromPlace(data)).toList();

    // If there is no address provided, get it from the coordinates.
    var formattedAddress = "";
    if (address == null) {
      formattedAddress = await getAddressFromCoordinates(latitude, longitude);
    } else {
      formattedAddress = address;
    }

    return RestaurantsResponse(
        restaurants: restaurants, address: formattedAddress);
  }

  // A function that returns a list of places with a given address.
  Future<RestaurantsResponse> getPlacesFromAddress(String address) async {
    // If address is defined, continue, else return empty list
    if (address != "") {
      // Get address coordinates with Google API
      final Uri uri = Uri.https("maps.googleapis.com", "/maps/api/geocode/json",
          {"address": address, "language": "fr", "key": googleApiKey});

      final response = await http.get(uri, headers: {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      });
      var results = json.decode(response.body)["results"];
      if (results.length > 0) {
        // Get first result from results
        var result = results[0];
        // Get coordinates from first result
        var coordinates = result["geometry"]["location"];
        // Get latitude and longitude from coordinates
        var latitude = coordinates["lat"].toString();
        var longitude = coordinates["lng"].toString();

        // Get formattedAddress from result
        var formattedAddress = result["formatted_address"];

        // Get places from coordinates
        return getPlacesFromCoordinates(latitude, longitude, formattedAddress);
      } else {
        return RestaurantsResponse(restaurants: [], address: address);
      }
    } else {
      return RestaurantsResponse(restaurants: [], address: "");
    }
  }
}

// Get details from placeId
Future<PlaceDetails?> getPlaceDetails(Restaurant restaurant) async {
  if (restaurant.placeId != "") {
    // Fetch Google Places API data by placeId
    final Uri uri = Uri.https(
        "maps.googleapis.com",
        "/maps/api/place/details/json",
        {"placeid": restaurant.placeId, "language": "fr", "key": googleApiKey});

    final response = await http.get(uri, headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });

    // Decode the JSON response
    var result = json.decode(response.body)["result"];

    // Get place details from result
    var placeDetails = PlaceDetails.fromJson(result);

    // Print place details
    print(placeDetails.toString());

    return placeDetails;
  } else {
    return null;
  }
}

// Get address from coordinates
Future<String> getAddressFromCoordinates(
    String latitude, String longitude) async {
  // Fetch Google Places API data by coordinates with given type and language
  final Uri uri = Uri.https("maps.googleapis.com", "/maps/api/geocode/json", {
    "latlng": "$latitude,$longitude",
    "language": "fr",
    "key": googleApiKey
  });

  final response = await http.get(uri, headers: {
    "Accept": "application/json",
    "Access-Control_Allow_Origin": "*"
  });

  // Decode the JSON response
  var results = json.decode(response.body)["results"];

  // If there is a result, return the first one
  if (results.length > 0) {
    return results[0]["formatted_address"];
  } else {
    return "";
  }
}
