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
