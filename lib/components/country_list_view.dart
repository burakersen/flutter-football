import 'package:flutter/material.dart';
import 'package:flutter_football/components/country_card.dart';

import '../models/country.dart';

class CountryListView extends StatelessWidget {
  final List<Country> countries;
  const CountryListView({
    Key? key,
    required this.countries
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        primary: true,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: countries.length,
        itemBuilder: (context, index) {
          final country = countries[index];
          return CountryCard(country: country);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
      ),
    );
  }
}
