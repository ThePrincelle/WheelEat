import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/restaurant.dart';
import '../services/gps.dart';
import '../services/places.dart';

import 'restaurant_details.dart';

import '../components/page_title.dart';
import '../components/search_bar.dart';
import '../components/restaurant_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Restaurant> restaurants = [];
  double longitude = 7.738757;
  double latitude = 48.526559;
  bool positionAvailable = false;
  String restaurantEmptyMsg = 'Fetching restaurants...';

  Future<void> fetchNearbyRestaurants() async {
    try {
      var position = await getUserPosition();
      latitude = position.latitude;
      longitude = position.longitude;
      setState(() {
        positionAvailable = true;
      });
    } catch (error) {
      longitude = 7.738757;
      latitude = 48.526559;
      setState(() {
        positionAvailable = false;
      });
    }

    try {
      var restaurantResponse = await Places.getPlacesFromCoordinates(
          latitude.toString(), longitude.toString());
      setState(() {
        restaurants = restaurantResponse.restaurants ?? [];
      });
    } catch (_) {
      setState(() {
        restaurantEmptyMsg =
            'Error fetching restaurants.\nRestaurant API is not available.';
        restaurants = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();

    () async {
      await fetchNearbyRestaurants();
    }();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultPadding * 4),
            const PageTitle('HUNGRY?!'),
            const SizedBox(height: defaultPadding * 2),
            SearchBar(onSearch: () {}), // TODO: Update this onPressed
            const SizedBox(height: defaultPadding),
            if (!positionAvailable)
              const Text(
                  'Position not available.\nUse of default location: Pôle API, Illkirch, France'),
            const SizedBox(height: defaultPadding),
            if (restaurants.isNotEmpty)
              Expanded(
                child: ListView.separated(
                  itemCount: restaurants.length,
                  itemBuilder: (_, index) => RestaurantListTile(
                    restaurant: restaurants[index],
                    onTap: () async {
                      var details = await getPlaceDetails(restaurants[index]);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RestaurantDetailsPage(
                            restaurant: restaurants[index],
                            openingHours: details?.openingHours,
                          ),
                        ),
                      );
                    },
                  ),
                  separatorBuilder: (_, index) =>
                      const SizedBox(height: defaultPadding / 2),
                ),
              )
            else
              Expanded(
                child: Center(
                  child: Text(
                    restaurantEmptyMsg,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w900,
                      fontSize: defaultPadding,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
