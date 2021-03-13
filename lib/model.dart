// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

Post postsFromJson(String str) => Post.fromJson(json.decode(str));

String postsToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    this.id,
    this.category,
    this.createdAt,
    this.externalGames,
    this.name,
    this.slug,
    this.updatedAt,
    this.url,
    this.versionParent,
    this.versionTitle,
    this.checksum,
  });

  int id;
  int category;
  int createdAt;
  List<int> externalGames;
  String name;
  String slug;
  int updatedAt;
  String url;
  int versionParent;
  String versionTitle;
  String checksum;

factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    category: json["category"],
    createdAt: json["created_at"],
    // externalGames: List<int>.from(json["external_games"].map((x) => x)),
    name: json["name"],
    slug: json["slug"],
    updatedAt: json["updated_at"],
    url: json["url"],
    versionParent: json["version_parent"],
    versionTitle: json["version_title"],
    checksum: json["checksum"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "created_at": createdAt,
    "external_games": List<dynamic>.from(externalGames.map((x) => x)),
    "name": name,
    "slug": slug,
    "updated_at": updatedAt,
    "url": url,
    "version_parent": versionParent,
    "version_title": versionTitle,
    "checksum": checksum,
  };
}
