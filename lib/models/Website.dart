import 'dart:convert';

List<Website> postsFromJson(String str) => List<Website>.from(json.decode(str).map((x) => Website.fromJson(x)));

class Website {
  Website({
    this.id,
    this.category,
    this.game,
    this.trusted,
    this.url,
  });

  int id;
  int category;
  int game;
  bool trusted;
  String url;

  factory Website.fromJson(Map<String, dynamic> json) => Website(
    id: json["id"],
    category: json["category"],
    game: json["game"],
    trusted: json["trusted"],
    url: json["url"],
  );
}
