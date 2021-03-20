// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    this.id,
    this.name,
    this.platforms,
    this.releaseDates,
  });

  int id;
  String name;
  List<Platform> platforms;
  List<ReleaseDate> releaseDates;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    id: json["id"],
    name: json["name"],
    platforms: List<Platform>.from(json["platforms"].map((x) => Platform.fromJson(x))),
    releaseDates: List<ReleaseDate>.from(json["release_dates"].map((x) => ReleaseDate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "platforms": List<dynamic>.from(platforms.map((x) => x.toJson())),
    "release_dates": List<dynamic>.from(releaseDates.map((x) => x.toJson())),
  };
}

class Platform {
  Platform({
    this.id,
    this.abbreviation,
    this.alternativeName,
    this.category,
    this.createdAt,
    this.name,
    this.platformLogo,
    this.slug,
    this.updatedAt,
    this.url,
    this.versions,
    this.websites,
    this.checksum,
    this.generation,
    this.platformFamily,
    this.summary,
  });

  int id;
  String abbreviation;
  String alternativeName;
  int category;
  int createdAt;
  String name;
  int platformLogo;
  String slug;
  int updatedAt;
  String url;
  List<int> versions;
  List<int> websites;
  String checksum;
  int generation;
  int platformFamily;
  String summary;

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
    id: json["id"],
    abbreviation: json["abbreviation"],
    alternativeName: json["alternative_name"],
    category: json["category"],
    createdAt: json["created_at"],
    name: json["name"],
    platformLogo: json["platform_logo"],
    slug: json["slug"],
    updatedAt: json["updated_at"],
    url: json["url"],
    versions: List<int>.from(json["versions"].map((x) => x)),
    websites: List<int>.from(json["websites"].map((x) => x)),
    checksum: json["checksum"],
    generation: json["generation"] == null ? null : json["generation"],
    platformFamily: json["platform_family"] == null ? null : json["platform_family"],
    summary: json["summary"] == null ? null : json["summary"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "abbreviation": abbreviation,
    "alternative_name": alternativeName,
    "category": category,
    "created_at": createdAt,
    "name": name,
    "platform_logo": platformLogo,
    "slug": slug,
    "updated_at": updatedAt,
    "url": url,
    "versions": List<dynamic>.from(versions.map((x) => x)),
    "websites": List<dynamic>.from(websites.map((x) => x)),
    "checksum": checksum,
    "generation": generation == null ? null : generation,
    "platform_family": platformFamily == null ? null : platformFamily,
    "summary": summary == null ? null : summary,
  };
}

class ReleaseDate {
  ReleaseDate({
    this.id,
    this.category,
    this.createdAt,
    this.date,
    this.game,
    this.human,
    this.m,
    this.platform,
    this.region,
    this.updatedAt,
    this.y,
    this.checksum,
  });

  int id;
  int category;
  int createdAt;
  int date;
  int game;
  String human;
  int m;
  int platform;
  int region;
  int updatedAt;
  int y;
  String checksum;

  factory ReleaseDate.fromJson(Map<String, dynamic> json) => ReleaseDate(
    id: json["id"],
    category: json["category"],
    createdAt: json["created_at"],
    date: json["date"],
    game: json["game"],
    human: json["human"],
    m: json["m"],
    platform: json["platform"],
    region: json["region"],
    updatedAt: json["updated_at"],
    y: json["y"],
    checksum: json["checksum"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "created_at": createdAt,
    "date": date,
    "game": game,
    "human": human,
    "m": m,
    "platform": platform,
    "region": region,
    "updated_at": updatedAt,
    "y": y,
    "checksum": checksum,
  };
}
