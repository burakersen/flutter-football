import 'package:flutter/material.dart';
import 'package:flutter_football/components/country_list_view.dart';
import 'package:flutter_football/models/country.dart';
import 'package:flutter_football/services/CountryService.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  final CountryService countryService = CountryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Football',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: countryService.fetchCountries(),
          builder: (context, AsyncSnapshot<List<Country>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CountryListView(countries: snapshot.data ?? []);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
