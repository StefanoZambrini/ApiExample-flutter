import 'dart:convert';

List<Genre> postsFromJson(String str) => List<Genre>.from(json.decode(str).map((x) => Genre.fromJson(x)));

class Genre {
  Genre({
    this.id,
    this.createdAt,
    this.name,
    this.slug,
    this.updatedAt,
    this.url,
    this.checksum,
  });

  int id;
  int createdAt;
  String name;
  String slug;
  int updatedAt;
  String url;
  String checksum;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    createdAt: json["created_at"],
    name: json["name"],
    slug: json["slug"],
    updatedAt: json["updated_at"],
    url: json["url"],
    checksum: json["checksum"],
  );
}
