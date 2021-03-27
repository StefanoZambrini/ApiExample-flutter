class Platform {
  Platform({
    this.id,
    this.abbreviation,
    this.alternativeName,
    this.category,
    this.createdAt,
    this.name,
    this.platformLogo,
    // this.slug,
    // this.updatedAt,
    this.url,
    // this.versions,
    // this.websites,
    // this.checksum,
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
  // String slug;
  // int updatedAt;
  String url;
  // List<int> versions;
  // List<Website> websites;
  // String checksum;
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
    // slug: json["slug"],
    // updatedAt: json["updated_at"],
    url: json["url"],
    // versions: List<int>.from(json["versions"].map((x) => x)),
    // websites: List<int>.from(json["websites"].map((x) => x)),
    // checksum: json["checksum"],
    generation: json["generation"] == null ? null : json["generation"],
    platformFamily: json["platform_family"] == null ? null : json["platform_family"],
    summary: json["summary"] == null ? null : json["summary"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "abbreviation": abbreviation,
    "alternative_name": alternativeName,
    "category": category,
    "created_at": createdAt,
    "name": name,
    "platform_logo": platformLogo,
    // "slug": slug,
    // "updated_at": updatedAt,
    "url": url,
    // "versions": List<dynamic>.from(versions.map((x) => x)),
    // "websites": List<dynamic>.from(websites.map((x) => x)),
    // "checksum": checksum,
    "generation": generation == null ? null : generation,
    "platform_family": platformFamily == null ? null : platformFamily,
    "summary": summary == null ? null : summary,
  };
}