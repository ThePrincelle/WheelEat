import 'package:google_place/google_place.dart';

class Places {
  // TODO: Add API-Key
  var googlePlace = GooglePlace("Your-Key");

  // A function that returns a list of places with a given keyword.
  Future<List<SearchResult>> getPlaces(String keyword) async {
    var result = await googlePlace.search.getNearBySearch(
      Location(lat: -33.8670522, lng: 151.1957362),
      1500,
      type: "restaurant",
      keyword: keyword,
    );
    // TODO: Format API response
    return result!.results!;
  }
}
