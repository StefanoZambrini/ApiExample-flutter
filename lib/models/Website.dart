import 'dart:convert';

List<Website> postsFromJson(String str) => List<Website>.from(json.decode(str).map((x) => Website.fromJson(x)));

String postsToJson(List<Website> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Website {
  Website({
    this.id,
    this.category,
    this.game,
    this.trusted,
    this.url,
  // this.checksum,
  });

  int id;
  int category;
  int game;
  bool trusted;
  String url;
  // String checksum;

  factory Website.fromJson(Map<String, dynamic> json) => Website(
    id: json["id"],
    category: json["category"],
    game: json["game"],
    trusted: json["trusted"],
    url: json["url"],
    // checksum: json["checksum"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "game": game,
    "trusted": trusted,
    "url": url,
    // "checksum": checksum,
  };
}
