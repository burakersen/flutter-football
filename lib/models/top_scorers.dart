class TopScorers {
  Player? player;
  Statistics? statistics;

  TopScorers(
      {this.player,
        this.statistics,});

  TopScorers.fromJson(Map<String, dynamic> json) {
    player = json['player'] != null ? Player.fromJson(json['player']) : null;
    statistics = json['statistics'] != null ? Statistics.fromJson(json['statistics'][0]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.player != null) {
      data['player'] = this.player?.toJson();
    }
    if (this.statistics != null) {
      data['statistics'] = this.statistics?.toJson();
    }

    return data;
  }
}

class Player {
  int? id;
  late String name;
  String? firstname;
  String? lastname;
  int? age;
  late String nationality;
  String? height;
  String? weight;
  bool? injured;
  late String photo;

  Player(
    {this.id,
      required this.name,
      this.firstname,
      this.lastname,
      this.age,
      required this.nationality,
      this.height,
      this.weight,
      this.injured,
      required this.photo,});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    age = json['age'];
    nationality = json['nationality'];
    height = json['height'];
    weight = json['weight'];
    injured = json['injured'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['age'] = this.age;
    data['nationality'] = this.nationality;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['injured'] = this.injured;
    data['photo'] = this.photo;

    return data;
  }
}

class Statistics {
  late Team team;
  Leaguee? league;
  Games? games;
  Goals? goals;
  Cards? cards;

  Statistics(
  {required this.team,
    this.league,
    this.games,
    this.goals,
    this.cards,});

  Statistics.fromJson(Map<String, dynamic> json) {
    team = (json['team'] != null ? Team.fromJson(json['team']) : null)!;
    league = json['league'] != null ? Leaguee.fromJson(json['league']) : null;
    games = json['games'] != null ? Games.fromJson(json['games']) : null;
    goals = json['goals'] != null ? Goals.fromJson(json['goals']) : null;
    cards = json['cards'] != null ? Cards.fromJson(json['cards']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.team != null) {
      data['team'] = this.team?.toJson();
    }
    if (this.league != null) {
      data['league'] = this.league?.toJson();
    }
    if (this.games != null) {
      data['games'] = this.games?.toJson();
    }
    if (this.goals != null) {
      data['goals'] = this.goals?.toJson();
    }
    if (this.cards != null) {
      data['cards'] = this.cards?.toJson();
    }

    return data;
  }
}

class Team {
  int? id;
  late String name;
  late String logo;

  Team(
    {this.id,
      required this.name,
      required this.logo,});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;

    return data;
  }
}

class Leaguee {
  int? id;
  String? name;
  String? country;
  late String logo;
  String? flag;
  int? season;

  Leaguee(
      {this.id,
        this.name,
        this.country,
        required this.logo,
        this.flag,
        this.season});

  Leaguee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    flag = json['flag'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    data['logo'] = this.logo;
    data['flag'] = this.flag;
    data['season'] = this.season;

    return data;
  }
}

class Games {
  int? appearences;
  int? lineups;
  int? minutes;
  int? number;
  String? position;
  String? rating;
  bool? captain;

  Games(
      {this.appearences,
        this.lineups,
        this.minutes,
        this.number,
        this.position,
        this.rating,
        this.captain});

  Games.fromJson(Map<String, dynamic> json) {
    appearences = json['appearences'];
    lineups = json['lineups'];
    minutes = json['minutes'];
    number = json['number'];
    position = json['position'];
    rating = json['rating'];
    captain = json['captain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['appearences'] = this.appearences;
    data['lineups'] = this.lineups;
    data['minutes'] = this.minutes;
    data['number'] = this.number;
    data['position'] = this.position;
    data['rating'] = this.rating;
    data['captain'] = this.captain;

    return data;
  }
}

class Goals {
  int? total;
  int? conceded;
  int? assists;
  int? saves;

  Goals(
      {this.total,
        this.conceded,
        this.assists,
        this.saves,});

  Goals.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    conceded = json['conceded'];
    assists = json['assists'];
    saves = json['saves'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['total'] = this.total;
    data['conceded'] = this.conceded;
    data['assists'] = this.assists;
    data['saves'] = this.saves;

    return data;
  }
}

class Cards {
  int? yellow;
  int? yellowred;
  int? red;

  Cards(
      {this.yellow,
        this.yellowred,
        this.red,});

  Cards.fromJson(Map<String, dynamic> json) {
    yellow = json['yellow'];
    yellowred = json['yellowred'];
    red = json['red'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['yellow'] = this.yellow;
    data['yellowred'] = this.yellowred;
    data['red'] = this.red;

    return data;
  }
}