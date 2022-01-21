import '../restaurant.dart';

const List<Restaurant> mockedRestaurants = [
  Restaurant(
    title: 'Lily & the magic potatoes',
    category: RestaurantCategory.fastFood,
    isOpened: true,
    rating: 4.6,
    priceLevel: 3,
    address: "36 Rue de l'Industrie,\n67400 Illkirch-Graffenshtaden",
    phone: "06 22 41 87 53",
    image:
        "https://img.restaurantguru.com/c6be-Restaurant-Lily-and-The-Magic-Potatoes-view.jpg",
    schedule: {
      'lundi': '11:30 - 14:00',
      'mardi': '11:30 - 14:00',
      'mercredi': '11:30 - 14:00, 18:15 - 21:00',
      'jeudi': '11:30 - 14:00, 18:15 - 21:00',
      'vendredi': '11:30 - 14:00, 18:15 - 21:00',
      'samedi': 'Fermé',
      'dimanche': 'Fermé',
    },
  ),
  Restaurant(
    title: 'Pitaya Thaï Street Food',
    category: RestaurantCategory.restaurant,
    isOpened: true,
    rating: 4.5,
    priceLevel: 4,
  ),
  Restaurant(
    title: "McDonald's",
    category: RestaurantCategory.fastFood,
    isOpened: true,
    rating: 3.9,
    priceLevel: 2,
    image:
        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/McDonald%27s_Golden_Arches.svg/1200px-McDonald%27s_Golden_Arches.svg.png",
  ),
  Restaurant(
    title: 'Del Arte',
    category: RestaurantCategory.restaurant,
    isOpened: false,
    rating: 4.3,
    priceLevel: 3,
    image: "https://upload.wikimedia.org/wikipedia/fr/0/00/Logo-del-arte.jpg",
  ),
  Restaurant(
    title: "Domino's Pizza",
    category: RestaurantCategory.pizzeria,
    isOpened: false,
    rating: 4.3,
    priceLevel: 3,
    image:
        "https://i2.wp.com/www.grapheine.com/wp-content/uploads/2012/09/dominos2012.jpg?fit=521%2C176&quality=90&strip=all&ssl=1",
  ),
  Restaurant(
    title: 'Restaurant without price',
    rating: 2.5,
  ),
  Restaurant(
    title: 'Restaurant with a really long title that takes multiple lines',
  ),
];
