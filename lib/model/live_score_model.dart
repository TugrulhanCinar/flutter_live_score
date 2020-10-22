// To parse this JSON data, do
//
//     final liveScore = liveScoreFromJson(jsonString);

import 'dart:convert';

LiveScore liveScoreFromJson(String str) => LiveScore.fromJson(json.decode(str));

String liveScoreToJson(LiveScore data) => json.encode(data.toJson());

class LiveScore {
  LiveScore({
    this.matches,
  });

  List<Match> matches;

  factory LiveScore.fromJson(Map<String, dynamic> json) => LiveScore(
    matches: json["matches"] == null ? null : List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
  );

  factory LiveScore.stringToJson(String str) => LiveScore.fromJson(json.decode(str));


  Map<String, dynamic> toJson() => {
    "matches": matches == null ? null : List<dynamic>.from(matches.map((x) => x.toJson())),
  };
}

class Match {
  Match({
    this.lig,
    this.maclar,
  });

  String lig;
  List<Maclar> maclar;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    lig: json["lig"] == null ? null : json["lig"],
    maclar: json["maclar"] == null ? null : List<Maclar>.from(json["maclar"].map((x) => Maclar.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "lig": lig == null ? null : lig,
    "maclar": maclar == null ? null : List<dynamic>.from(maclar.map((x) => x.toJson())),
  };
}

class Maclar {
  Maclar({
    this.kick,
    this.status,
    this.score,
    this.home,
    this.away,
    this.halftime,
  });

  String kick;
  String status;
  String score;
  String home;
  String away;
  String halftime;

  factory Maclar.fromJson(Map<String, dynamic> json) => Maclar(
    kick: json["kick"] == null ? "null" : json["kick"],
    status: json["status"] == null ? "null" : json["status"],
    score: json["score"] == null ? "null" : json["score"],
    home: json["home"] == null ? "null" : json["home"],
    away: json["away"] == null ? "null" : json["away"],
    halftime: json["halftime"] == null ? "null" : json["halftime"],
  );

  Map<String, dynamic> toJson() => {
    "kick": kick == null ? null : kick,
    "status": status == null ? null : status,
    "score": score == null ? null : score,
    "home": home == null ? null : home,
    "away": away == null ? null : away,
    "halftime": halftime == null ? null : halftime,
  };
}
/*
score: "1-0",
 */