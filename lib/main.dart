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
  // Default address for Pole API, Illkirch, France.
  print(Places().getPlacesFromAddress("Pole API, Illkirch, France"));

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
