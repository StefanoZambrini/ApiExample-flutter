import 'dart:convert';

List<Genre> postsFromJson(String str) => List<Genre>.from(json.decode(str).map((x) => Genre.fromJson(x)));

String postsToJson(List<Genre> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt,
    "name": name,
    "slug": slug,
    "updated_at": updatedAt,
    "url": url,
    "checksum": checksum,
  };
}
