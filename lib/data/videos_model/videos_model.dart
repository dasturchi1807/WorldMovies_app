class VideosModel {
  int? id;
  Videos? videos;

  VideosModel({
    required this.id,
    required this.videos,
  });

  factory VideosModel.fromJson(Map<String, dynamic> json) {
    return VideosModel(id: json["id"], videos: json["videos"]);
  }
}

class Videos {
  String? iso_639_1;
  String? iso_3166_1;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? published_at;
  String? id;

  Videos({
    required this.iso_639_1,
    required this.iso_3166_1,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.published_at,
    required this.id,
  });

  factory Videos.fromJson(Map<String, dynamic> json) {
    return Videos(
        iso_639_1: json["iso_639_1"] ?? "",
        iso_3166_1: json["iso_3166_1"] ?? "",
        name: json["name"] ?? "",
        key: json["key"] ?? "",
        site: json["site"] ?? "",
        size: json["size"] ?? 0,
        type: json["type"] ?? "",
        official: json["official"] ?? "",
        published_at: json["published_at"] ?? "",
        id: json["id"] ?? "");
  }
}
