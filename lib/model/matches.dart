class AllMatches {
  List<ResponseOfMatches> response = [];
  AllMatches.fromJson(Map<String, dynamic> json) {
    json["response"].forEach((e) {
      response.add(ResponseOfMatches.fromJson(e));
    });
  }
}

class ResponseOfMatches {
  late League league;
  late Teams teams;
  late Goals goals;
  late Fixture fixture;
  ResponseOfMatches.fromJson(Map<String, dynamic> json) {
    league = League.fromJson(json["league"]);
    teams = Teams.fromJson(json["teams"]);
    goals = Goals.fromJson(json["goals"]);
    fixture = Fixture.fromJson(json["fixture"]);
  }
}

class Fixture {
  late Venue venue;
  late Status status;
  Fixture.fromJson(Map<String, dynamic> json) {
    venue = Venue.fromJson(json["venue"]);
    status = Status.fromJson(json["status"]);
  }
}

class Venue {
  late String staduim;
  late String city;
  Venue.fromJson(Map<String, dynamic> json) {
    staduim = json["name"];
    city = json["city"];
  }
}

class Status {
  String? short;
  Status.fromJson(Map<String, dynamic> json) {
    short = json["short"];
  }
}

class League {
  late String name;
  late String country;
  League.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    country = json["country"];
  }
}

class Goals {
  int? home;
  int? away;
  Goals.fromJson(Map<String, dynamic> json) {
    home = json["home"];
    away = json["away"];
  }
}

class Teams {
  late Home home;
  late Away away;
  Teams.fromJson(Map<String, dynamic> json) {
    home = Home.fromJson(json["home"]);
    away = Away.fromJson(json["away"]);
  }
}

class Home {
  late String name;
  late String logo;
  bool? winner;
  Home.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    logo = json["logo"];
    winner = json["winner"];
  }
}

class Away {
  late String name;
  late String logo;
  bool? winner;
  Away.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    logo = json["logo"];
    winner = json["winner"];
  }
}
