import 'dart:async';
import 'dart:convert';

import 'package:flutter_football/environment.dart';
import 'package:flutter_football/models/league.dart';
import 'package:http/http.dart' as http;

import '../models/country.dart';

class LeagueService {
  Future<List<League>> fetchLeagues(Country country, int season) async {
    final response = await http
        .get(
          Uri.parse(
            '${Environment.leaguesUrl}?code=${country.code}&season=$season'),
          headers: Environment.requestHeaders);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json['response'] != null) {
        final leagues = <League>[];
        json['response'].forEach((v) {
          leagues.add(League.fromJson(v['league']));
        });
        return leagues;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load leagues');
    }
  }
}

