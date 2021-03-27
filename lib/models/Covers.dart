import 'dart:convert';

import 'package:api_challenge/models/Game.dart';

List<Cover> postsFromJson(String str) => List<Cover>.from(json.decode(str).map((x) => Cover.fromJson(x)));

final coverDemo = Cover(id: 10, alphaChannel: false, animated: true, game: gameDemo, height: 10, imageId: "imageID", url: "url", width: 10, checksum: "checkSum");

class Cover {
  Cover({
    this.id,
    this.alphaChannel,
    this.animated,
    this.game,
    this.height,
    this.imageId,
    this.url,
    this.width,
    this.checksum,
  });

  int id;
  bool alphaChannel;
  bool animated;
  Game game;
  int height;
  String imageId;
  String url;
  int width;
  String checksum;

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
    id: json["id"],
    alphaChannel: json["alpha_channel"] == null ? null : json["alpha_channel"],
    animated: json["animated"] == null ? null : json["animated"],
    game: json["game"],
    height: json["height"],
    imageId: json["image_id"],
    url: json["url"],
    width: json["width"],
    checksum: json["checksum"],
  );
}
