import 'key.dart';

class Environment {
  static const String API_BASE_V2__URL =
      'https://api-football-v1.p.rapidapi.com/v2/';

  static const String API_BASE_V3__URL =
      'https://api-football-v1.p.rapidapi.com/v3/';

  static const String countriesUrl = '${API_BASE_V3__URL}countries';
  static const String leaguesUrl = '${API_BASE_V3__URL}leagues';
  static const String standingsUrl = '${API_BASE_V3__URL}standings';

  static final Map<String, String> requestHeaders = {
    'X-RapidAPI-Key': Key.API_KEY,
    'X-RapidAPI-Host': Key.API_HOST,
    'Content-Type': 'application/json'
  };
}