import 'dart:convert';

List<Screenshot> postsFromJson(String str) => List<Screenshot>.from(json.decode(str).map((x) => Screenshot.fromJson(x)));

class Screenshot {
  Screenshot({
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
  int game;
  int height;
  String imageId;
  String url;
  int width;
  String checksum;

  factory Screenshot.fromJson(Map<String, dynamic> json) => Screenshot(
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
