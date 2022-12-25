import 'dart:async';
import 'dart:convert';

import 'package:flutter_football/environment.dart';
import 'package:flutter_football/models/league.dart';
import 'package:flutter_football/models/top_scorers.dart';
import 'package:http/http.dart' as http;

class TopScorersService {
  Future<List<TopScorers>> fetchTopScorers(League league, int season) async {
    final response = await http
        .get(
        Uri.parse(
            '${Environment.topScorersUrl}?league=${league.id}&season=$season'),
        headers: Environment.requestHeaders);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);

      if (json['response'] != null) {
        final topScorers = <TopScorers>[];
        json['response'].forEach((v) {
          topScorers.add(TopScorers.fromJson(v));
        });
        return topScorers;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load top scorers');
    }
  }
}

