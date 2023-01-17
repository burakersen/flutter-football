class Standings {
  int? rank;
  Team? team;
  int? points;
  int? goalsDiff;
  String? group;
  late String form;
  String? status;
  String? description;
  All? all;
  All? home;
  All? away;

  Standings(
      {this.rank,
        this.team,
        this.points,
        this.goalsDiff,
        this.group,
        required this.form,
        this.status,
        this.description,
        this.all,
        this.home,
        this.away,});

  Standings.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
    points = json['points'];
    goalsDiff = json['goalsDiff'];
    group = json['group'];
    form = json['form'];
    status = json['status'];
    description = json['description'];
    all = json['all'] != null ? All.fromJson(json['all']) : null;
    home = json['home'] != null ? All.fromJson(json['home']) : null;
    away = json['away'] != null ? All.fromJson(json['away']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rank'] = this.rank;
    if (this.team != null) {
      data['team'] = this.team?.toJson();
    }
    data['points'] = this.points;
    data['goalsDiff'] = this.goalsDiff;
    data['group'] = this.group;
    data['form'] = this.form;
    data['status'] = this.status;
    data['description'] = this.description;
    if (this.all != null) {
      data['all'] = this.all?.toJson();
    }
    if (this.home != null) {
      data['home'] = this.home?.toJson();
    }
    if (this.away != null) {
      data['away'] = this.away?.toJson();
    }
    return data;
  }
}

class All {
  int? played;
  int? win;
  int? draw;
  int? lose;
  All(
      {this.played,
        this.win,
        this.draw,
        this.lose,});

  All.fromJson(Map<String, dynamic> json) {
    played = json['played'];
    win = json['win'];
    draw = json['draw'];
    lose = json['lose'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['played'] = this.played;
    data['win'] = this.win;
    data['draw'] = this.draw;
    data['lose'] = this.lose;
    return data;
  }
}

class Team {
  late int id;
  late String name;
  late String logo;

  Team(
      {required this.id,
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