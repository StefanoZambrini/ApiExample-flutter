// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

List<Videos> postsFromJson(String str) => List<Videos>.from(json.decode(str).map((x) => Videos.fromJson(x)));

String postsToJson(List<Videos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Videos {
  Videos({
    this.id,
    this.game,
    this.name,
    this.videoId,
    this.checksum,
  });

  int id;
  int game;
  String name;
  String videoId;
  String checksum;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
    id: json["id"],
    game: json["game"],
    name: json["name"],
    videoId: json["video_id"],
    checksum: json["checksum"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "game": game,
    "name": name,
    "video_id": videoId,
    "checksum": checksum,
  };
}
