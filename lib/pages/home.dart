import 'package:flutter/material.dart';

import '../constants.dart';
// TODO: Remove mock data when Google Places API is implemented
import '../data/mocks/restaurant.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: defaultPadding * 4),
              const PageTitle('HUNGRY?!'),
              const SizedBox(height: defaultPadding * 2),
              SearchBar(onSearch: () {}), // TODO: Update this onPressed
              const SizedBox(height: defaultPadding * 2),
              Expanded(
                child: ListView.separated(
                  itemCount: restaurants.length,
                  itemBuilder: (_, index) => RestaurantListTile(
                    restaurant: restaurants[index],
                    // selected: index == 1, // TODO: Change this with dynamic data
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RestaurantDetailsPage(
                            restaurant: restaurants[index],
                          ),
                        ),
                      );
                    },
                  ),
                  separatorBuilder: (_, index) =>
                      const SizedBox(height: defaultPadding / 2),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        // color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
          child: IconTheme(
            data: const IconThemeData(color: Colors.black54),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {}, // TODO: Update this onPressed
                  icon: const Icon(Icons.home),
                ),
                IconButton(
                  onPressed: () {}, // TODO: Update this onPressed
                  icon: const Icon(Icons.settings),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // TODO: Update this onPressed
        tooltip: 'Spin',
        child: const Icon(Icons.rotate_left, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
