import 'package:films_app/data/films_model/dates_model.dart';

import 'movie_model.dart';

class FilmsModel {
  DatesModel? dates;
  int? page;
  List<MovieModel>? results;
  int? total_pages;
  int? total_results;

  FilmsModel({
    required this.dates,
    required this.page,
    required this.results,
    required this.total_pages,
    required this.total_results,
  });

  factory FilmsModel.fromJson(Map<String, dynamic> json) {
    return FilmsModel(
      dates: DatesModel.fromJson(json['dates'] ?? {}),
      page: json['page'] ?? 0,
      results: List<MovieModel>.from(json['results'].map((x) => MovieModel.fromJson(x))),
      total_pages: json['total_pages'] ?? 0,
      total_results: json['total_results'] ?? 0,
    );
  }

}
