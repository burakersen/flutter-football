import 'dart:async';
import 'dart:convert';

import 'package:flutter_football/environment.dart';
import 'package:flutter_football/models/country.dart';
import 'package:http/http.dart' as http;

class CountryService {
  final customCountries = ['World', 'Portugal', 'France', 'Spain', 'Germany',
    'Italy', 'England', 'Turkey'];

  Future<List<Country>> fetchCountries() async {
    final response = await http
        .get(Uri.parse(Environment.countriesUrl), headers: Environment.requestHeaders);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json['response'] != null) {
        final countries = <Country>[];
        json['response'].forEach((v) {
          Country country = Country.fromJson(v);
          if (customCountries.contains(country.name)) {
            countries.add(country);
          }
        });
        return countries;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load countries');
    }
  }
}

