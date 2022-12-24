import 'dart:async';
import 'dart:convert';

import 'package:flutter_football/environment.dart';
import 'package:flutter_football/models/league.dart';
import 'package:flutter_football/models/standings.dart';
import 'package:http/http.dart' as http;

class StandingsService {
  Future<List<Standings>> fetchStandings(League league, int season) async {
    final response = await http
        .get(
        Uri.parse(
            '${Environment.standingsUrl}?league=${league.id}&season=$season'),
        headers: Environment.requestHeaders);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json['response'] != null) {
        final standings = <Standings>[];

        json['response'][0]['league']['standings'][0].forEach((v) {
          standings.add(Standings.fromJson(v));
        });
        return standings;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load standings');
    }
  }
}

