// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

Post postsFromJson(String str) => Post.fromJson(json.decode(str));

String postsToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    this.name,
    this.date,
    this.observed,
    this.public,
    this.country,
    this.uuid,
    this.weekday,
  });

  String name;
  DateTime date;
  DateTime observed;
  bool public;
  String country;
  String uuid;
  Weekday weekday;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    name: json["name"],
    date: DateTime.parse(json["date"]),
    observed: DateTime.parse(json["observed"]),
    public: json["public"],
    country: json["country"],
    uuid: json["uuid"],
    weekday: Weekday.fromJson(json["weekday"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "observed": "${observed.year.toString().padLeft(4, '0')}-${observed.month.toString().padLeft(2, '0')}-${observed.day.toString().padLeft(2, '0')}",
    "public": public,
    "country": country,
    "uuid": uuid,
    "weekday": weekday.toJson(),
  };
}

class Weekday {
  Weekday({
    this.date,
    this.observed,
  });

  Date date;
  Date observed;

  factory Weekday.fromJson(Map<String, dynamic> json) => Weekday(
    date: Date.fromJson(json["date"]),
    observed: Date.fromJson(json["observed"]),
  );

  Map<String, dynamic> toJson() => {
    "date": date.toJson(),
    "observed": observed.toJson(),
  };
}

class Date {
  Date({
    this.name,
    this.numeric,
  });

  String name;
  String numeric;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    name: json["name"],
    numeric: json["numeric"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "numeric": numeric,
  };
}
