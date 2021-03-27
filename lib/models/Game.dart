// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';
import 'package:api_challenge/models/Covers.dart';
import 'package:api_challenge/models/Genre.dart';
import 'package:api_challenge/models/Platform.dart';
import 'package:api_challenge/models/ReleaseDate.dart';
import 'package:api_challenge/models/Screenshot.dart';
import 'package:api_challenge/models/Videos.dart';
import 'package:api_challenge/models/Website.dart';

List<Game> welcomeFromJson(String str) => List<Game>.from(json.decode(str).map((x) => Game.fromJson(x)));


final gameDemo = Game(id: 1, aggregatedRating: 0.0, aggregatedRatingCount: 0.0, cover: 10, genres: [], name: "Game", platforms: [], rating: 7, releaseDates: [], screenshots: [], summary: "Summary", totalRating: 10, totalRatingCount: 10, url: "url", videos: [], websites: [], checksum: "checkSum");

class Game {

int id;
double aggregatedRating;
double aggregatedRatingCount;
// int category;
int cover;
// int createdAt;
// List<int> externalGames;
int firstReleaseDate;
// int follows;
List<Genre> genres;
String name;
List<Platform> platforms;
double rating;
List<ReleaseDate> releaseDates;
List<Screenshot> screenshots;
String summary;
// List<int> tags;
// List<int> themes;
  double totalRating;
  double totalRatingCount;
// int updatedAt;
String url;
List<Videos> videos;
List<Website> websites;
String checksum;

  Game({
    this.id,
    this.aggregatedRating,
    this.aggregatedRatingCount,
    // this.category,
    this.cover,
    // this.createdAt,
    // this.externalGames,
    this.firstReleaseDate,
    // this.follows,
    this.genres,
    this.name,
    this.platforms,
    this.rating,
    this.releaseDates,
    this.screenshots,
    this.summary,
    // this.tags,
    // this.themes,
    this.totalRating,
    this.totalRatingCount,
    // this.updatedAt,
    this.url,
    this.videos,
    this.websites,
    this.checksum,
  });


  factory Game.fromJson(Map<String, dynamic> json) => Game(
    id: json["id"],
    aggregatedRating: json["aggregated_rating"] == null ? 0.0 : json["aggregated_rating"].toDouble(),
    aggregatedRatingCount: json["aggregated_rating_count"] == null ? 0.0 : json["aggregated_rating_count"].toDouble(),
    cover: json['covers'],
    firstReleaseDate: json['first_release_date'],
    genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    name: json["name"],
    platforms: json["platforms"] == null ? [] : List<Platform>.from(json["platforms"].map((x) => Platform.fromJson(x))),
    rating: json["rating"] == null ? 0.0 : json["rating"].toDouble(),
    releaseDates: json["release_dates"] == null ? [] : List<ReleaseDate>.from(json["release_dates"].map((x) => ReleaseDate.fromJson(x))),
    screenshots: json["screenshots"] == null ? [] : List<Screenshot>.from(json["screenshots"].map((x) => Screenshot.fromJson(x))),
    summary: json["summary"],
    // tags: List<int>.from(json["tags"].map((x) => x)),
    // themes: json["themes"] == null ? null : List<int>.from(json["themes"].map((x) => x)),
    totalRating: json["total_rating"] == null ? 0.0 : json["total_rating"].toDouble(),
    totalRatingCount: json["total_rating_count"] == null ? 0.0 : json["total_rating_count"].toDouble(),
    url: json["url"],
    videos: json["videos"] == null ? [] : List<Videos>.from(json["videos"].map((x) => Videos.fromJson(x))),
    websites: json["websites"] == null ? [] : List<Website>.from(json["websites"].map((x) => Website.fromJson(x))),
    checksum: json["checksum"],
  );

}

