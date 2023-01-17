import 'dart:async';
import 'dart:convert';

import 'package:flutter_football/environment.dart';
import 'package:flutter_football/models/league.dart';
import '../models/fixture.dart';
import 'package:http/http.dart' as http;


class FixtureService {
  Future<List<Fixture>> fetchFixture(League league, int season, String date) async {
    final response = await http
        .get(
        Uri.parse(
            '${Environment.fixturesUrl}?league=${league.id}&season=$season&date=$date'),
        headers: Environment.requestHeaders);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json['response'] != null) {
        final fixtures = <Fixture>[];
        json['response'].forEach((v) {
          fixtures.add(Fixture.fromJson(v));
        });
        print(fixtures);
        return fixtures;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load fixtures');
    }
  }
}

