import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/restaurant.dart';
import '../services/models/types/opening_hours.dart';

import '../components/opened_closed_badge.dart';
import '../components/price_tags.dart';
import '../components/rating_stars.dart';
import '../components/schedule_table.dart';

class RestaurantDetailsPage extends StatelessWidget {
  final Restaurant restaurant;
  final OpeningHours? openingHours;
  final String? phone;

  const RestaurantDetailsPage({
    Key? key,
    this.restaurant = const Restaurant(title: 'Placeholder'),
    this.openingHours,
    this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(flex: 2, child: restaurantImage()),
              Expanded(flex: 5, child: Container()),
            ],
          ),
          Column(
            children: [
              // Trick to overlap content on background image
              Expanded(child: Container()),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: lightTextColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, -1),
                        blurRadius: 4.0,
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      defaultPadding * 2,
                      defaultPadding * 2,
                      defaultPadding * 2,
                      0,
                    ),
                    child: SafeArea(
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              restaurant.title.toUpperCase(),
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: defaultPadding * 1.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: defaultPadding),
                          Row(
                            children: [
                              OpenedClosedBadge(
                                restaurant.isOpened,
                                size: defaultPadding / 1.25,
                              ),
                              const Spacer(),
                              if (restaurant.priceLevel != null)
                                PriceTags(
                                  restaurant.priceLevel!,
                                  size: defaultPadding * 1.5,
                                ),
                              const SizedBox(width: defaultPadding / 4),
                              RatingStars(
                                restaurant.rating,
                                size: defaultPadding / 1.25,
                              ),
                            ],
                          ),
                          const SizedBox(height: defaultPadding * 2),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_on_rounded,
                                color: primaryColor,
                              ),
                              const SizedBox(width: defaultPadding / 4),
                              Expanded(
                                child: Text(
                                  restaurant.address ?? "No data available.",
                                  softWrap: true,
                                  style: const TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.w900,
                                    fontSize: defaultPadding,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: defaultPadding / 2),
                          Row(
                            children: [
                              const Icon(
                                Icons.phone,
                                color: primaryColor,
                              ),
                              const SizedBox(width: defaultPadding / 4),
                              Text(
                                restaurant.phone ??
                                    phone ??
                                    "No data available.",
                                softWrap: true,
                                style: const TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: defaultPadding,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: defaultPadding),
                          const Divider(),
                          Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.only(
                                top: defaultPadding,
                                bottom: defaultPadding,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Horaires",
                                      style: TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.w900,
                                        fontSize: defaultPadding,
                                      ),
                                    ),
                                    const SizedBox(height: defaultPadding / 2),
                                    if (openingHours != null)
                                      ScheduleTable(openingHours!)
                                    else
                                      const Text(
                                        "No data available",
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: defaultPadding,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actionButtons(context),
        ],
      ),
    );
  }

  Widget restaurantImage() {
    return restaurant.image != null
        ? Image.network(
            restaurant.image!,
            width: double.infinity,
            fit: BoxFit.cover,
            semanticLabel: "Restaurant photo",
          )
        : Container(
            width: double.infinity,
            color: primaryColor,
          );
  }

  Widget actionButtons(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: defaultPadding * 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.7),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: lightTextColor,
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: defaultPadding * 1.25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
