// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:api_challenge/models/Game.dart';

List<Franchise> welcomeFromJson(String str) => List<Franchise>.from(json.decode(str).map((x) => Franchise.fromJson(x)));

String welcomeToJson(List<Franchise> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Franchise {
  Franchise({
    this.id,
    this.createdAt,
    this.games,
    this.name,
    this.slug,
    this.updatedAt,
    this.url,
    this.checksum,
  });

  int id;
  int createdAt;
  List<Game> games;
  String name;
  String slug;
  int updatedAt;
  String url;
  String checksum;

  factory Franchise.fromJson(Map<String, dynamic> json) => Franchise(
    id: json["id"],
    createdAt: json["created_at"],
    games: List<Game>.from(json["games"].map((x) => x)),
    name: json["name"],
    slug: json["slug"],
    updatedAt: json["updated_at"],
    url: json["url"],
    checksum: json["checksum"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt,
    "games": List<dynamic>.from(games.map((x) => x)),
    "name": name,
    "slug": slug,
    "updated_at": updatedAt,
    "url": url,
    "checksum": checksum,
  };
}
