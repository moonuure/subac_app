import 'package:flutter/material.dart';


// my imports
import 'package:subac_app/Screens_or_pages/starting_page.dart';

void main() =>
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuranApp(),
  ));


class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartPage(),
    );
  }
}
