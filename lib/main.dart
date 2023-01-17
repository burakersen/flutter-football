import 'package:flutter/material.dart';
import 'package:flutter_football/screens/country_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0XFF567189);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),

      home: CountryScreen(),
    );
  }
}
