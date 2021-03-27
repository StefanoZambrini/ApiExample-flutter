class Platform {
  Platform({
    this.id,
    this.abbreviation,
    this.alternativeName,
    this.category,
    this.createdAt,
    this.name,
    this.platformLogo,
    this.url,
    this.generation,
    this.platformFamily,
    this.summary,
  });

  int id;
  String abbreviation;
  String alternativeName;
  int category;
  int createdAt;
  String name;
  int platformLogo;
  String url;
  int generation;
  int platformFamily;
  String summary;

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
    id: json["id"],
    abbreviation: json["abbreviation"],
    alternativeName: json["alternative_name"],
    category: json["category"],
    createdAt: json["created_at"],
    name: json["name"],
    platformLogo: json["platform_logo"],
    url: json["url"],
    generation: json["generation"] == null ? null : json["generation"],
    platformFamily: json["platform_family"] == null ? null : json["platform_family"],
    summary: json["summary"] == null ? null : json["summary"],
  );
}