// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

List<Videos> postsFromJson(String str) => List<Videos>.from(json.decode(str).map((x) => Videos.fromJson(x)));

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
}
