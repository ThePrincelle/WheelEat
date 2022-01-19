import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'constants.dart';

import 'pages/_layout.dart';

import './services/places.dart';

Future main() async {
  // Load the .env file
  await dotenv.load(fileName: ".env");

  // Test places
  // Default coordinates for Pole API, Illkirch, France.
  const latitude = '48.5254981';
  const longitude = '7.7376844';
  print(Places().getPlacesFromCoordinates(latitude, longitude));

  // Start the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WheelEat',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: textColor),
      ),
      home: const Layout(),
      debugShowCheckedModeBanner: false,
    );
  }
}
