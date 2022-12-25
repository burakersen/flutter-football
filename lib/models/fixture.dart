class Fixture {
  InnerFixture? fixture;
  Leaguee? league;
  Teams? teams;
  Goals? goals;
  Score? score;

  Fixture(
    {this.fixture,
      this.league,
      this.teams,
      this.goals,
      this.score,});

  Fixture.fromJson(Map<String, dynamic> json) {
    fixture = json['fixture'] != null ? InnerFixture.fromJson(json['fixture']) : null;
    league = json['league'] != null ? Leaguee.fromJson(json['league']) : null;
    teams = json['teams'] != null ? Teams.fromJson(json['teams']) : null;
    goals = json['goals'] != null ? Goals.fromJson(json['goals']) : null;
    score = json['score'] != null ? Score.fromJson(json['score']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.fixture != null) {
      data['fixture'] = this.fixture?.toJson();
    }
    if (this.league != null) {
      data['league'] = this.league?.toJson();
    }
    if (this.teams != null) {
      data['teams'] = this.teams?.toJson();
    }
    if (this.goals != null) {
      data['goals'] = this.goals?.toJson();
    }
    if (this.score != null) {
      data['score'] = this.score?.toJson();
    }

    return data;
  }
}

class InnerFixture {
  int? id;
  String? referee;
  String? timezone;
  String? date;
  int? timestamp;
  Venue? venue;
  Status? status;

  InnerFixture(
    {this.id,
      this.referee,
      this.timezone,
      this.date,
      this.timestamp,
      this.venue,
      this.status,});

  InnerFixture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referee = json['referee'];
    timezone = json['timezone'];
    date = json['date'];
    timestamp = json['timestamp'];
    venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['referee'] = this.referee;
    data['timezone'] = this.timezone;
    data['date'] = this.date;
    data['timestamp'] = this.timestamp;
    if (this.venue != null) {
      data['venue'] = this.venue?.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status?.toJson();
    }

    return data;
  }
}

class Venue {
  int? id;
  String? name;
  String? city;

  Venue(
    {this.id,
      this.name,
      this.city,});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['city'] = this.city;

    return data;
  }
}

class Status {
  String? long;
  String? short;
  int? elapsed;

  Status(
    {this.long,
      this.short,
      this.elapsed,});

  Status.fromJson(Map<String, dynamic> json) {
    long = json['long'];
    short = json['short'];
    elapsed = json['elapsed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['long'] = this.long;
    data['short'] = this.short;
    data['elapsed'] = this.elapsed;

    return data;
  }
}

class Leaguee {
  int? id;
  String? name;
  String? country;
  String? logo;
  String? flag;
  int? season;
  String? round;

  Leaguee(
      {this.id,
        this.name,
        this.country,
        this.logo,
        this.flag,
        this.season,
        this.round});

  Leaguee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    flag = json['flag'];
    season = json['season'];
    round = json['round'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    data['logo'] = this.logo;
    data['flag'] = this.flag;
    data['season'] = this.season;
    data['round'] = this.round;

    return data;
  }
}

class Teams {
  TeamsDetails? home;
  TeamsDetails? away;

  Teams(
      {this.home,
        this.away,});

  Teams.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? TeamsDetails.fromJson(json['home']) : null;
    away = json['away'] != null ? TeamsDetails.fromJson(json['away']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.home != null) {
      data['home'] = this.home?.toJson();
    }
    if (this.away != null) {
      data['away'] = this.away?.toJson();
    }

    return data;
  }
}

class TeamsDetails {
  int? id;
  String? name;
  String? logo;
  bool? winner;

  TeamsDetails(
      {this.id,
        this.name,
        this.logo,
        this.winner,});

  TeamsDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    winner = json['winner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['winner'] = this.winner;

    return data;
  }
}

class Goals {
  int? home;
  int? away;

  Goals(
      {this.home,
        this.away,});

  Goals.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['home'] = this.home;
    data['away'] = this.away;

    return data;
  }
}

class Score {
  ScoreDetails? halftime;
  ScoreDetails? fulltime;
  ScoreDetails? extratime;
  ScoreDetails? penalty;

  Score(
      {this.halftime,
        this.fulltime,
        this.extratime,
        this.penalty});

  Score.fromJson(Map<String, dynamic> json) {
    halftime = json['halftime'] != null ? ScoreDetails.fromJson(json['halftime']) : null;
    fulltime = json['fulltime'] != null ? ScoreDetails.fromJson(json['fulltime']) : null;
    extratime = json['extratime'] != null ? ScoreDetails.fromJson(json['extratime']) : null;
    penalty = json['penalty'] != null ? ScoreDetails.fromJson(json['penalty']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.halftime != null) {
      data['halftime'] = this.halftime?.toJson();
    }
    if (this.fulltime != null) {
      data['fulltime'] = this.fulltime?.toJson();
    }
    if (this.extratime != null) {
      data['extratime'] = this.extratime?.toJson();
    }
    if (this.penalty != null) {
      data['penalty'] = this.penalty?.toJson();
    }

    return data;
  }
}

class ScoreDetails {
  int? home;
  int? away;

  ScoreDetails(
      {this.home,
        this.away,});

  ScoreDetails.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['home'] = this.home;
    data['away'] = this.away;

    return data;
  }
}