import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'constants.dart';

import 'pages/_layout.dart';

Future main() async {
  // Load the .env file
  await dotenv.load(fileName: "envs");

  // Start the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set iOS status bar with dark text
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));

    return MaterialApp(
      title: 'WheelEat',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.amber,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: textColor),
      ),
      home: const Layout(),
      debugShowCheckedModeBanner: false,
    );
  }
}
