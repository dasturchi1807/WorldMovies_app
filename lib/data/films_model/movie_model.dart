class MovieModel {

  bool? adult;
  String? backdrop_path;
  List? genre_ids;
  int? id;
  String? original_language;
  String? original_title;
  String? overview;
  double? popularity;
  String? poster_path;
  String? release_date;
  String? title;
  bool? video;
  double? vote_average;
  int? vote_count;

  MovieModel({
    required this.adult,
    required this.backdrop_path,
    required this.genre_ids,
    required this.id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.release_date,
    required this.video,
    required this.title,
    required this.vote_average,
    required this.vote_count,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        adult: json['adult'],
        backdrop_path: json["backdrop_path"],
        genre_ids: json["genre_ids"],
        id: json["id"],
        original_language: json["original_language"],
        original_title: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"],
        poster_path: json["poster_path"],
        release_date: json["release_date"] ?? "",
        video: json["video"],
        title: json["title"],
        vote_average: json["vote_average"],
        vote_count: json["vote_count"]);
  }

}
