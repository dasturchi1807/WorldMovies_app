import 'package:films_app/data/films_model/movie_model.dart';

class FilmsData {
  static late String title;
  static late int vote_count;
  static late String popularity;
  static late String vote_average;
  static late String year;
  static late String image;
  static late int id;
  static late bool adult;
  static late String language;
  static late String overview;
  static late String backdrop_path;
  static late bool video;
  static late String original_title;

  static void filmsModelData(int index, List<MovieModel> data) {
    if (data.isNotEmpty) {
      title = data[index].title  ?? "";
      vote_count = data[index].vote_count  ?? 0;
      popularity = data[index].popularity!.toString();
      vote_average = data[index].vote_average!.toStringAsFixed(1);
      year = data[index].release_date  ?? "";
      image = data[index].poster_path  ?? "";
      id = data[index].id  ?? 0;
      adult = data[index].adult  ?? false;
      language = data[index].original_language  ?? "";
      overview = data[index].overview  ?? "";
      backdrop_path = data[index].backdrop_path  ?? "";
      video = data[index].video ?? false;
      original_title = data[index].original_title  ?? "";
    }
  }

}
class MovieData {
  static late String title;
  static late String vote_count;
  static late String popularity;
  static late String vote_average;
  static late String year;
  static late String image;
  static late int id;
  static late bool adult;
  static late String language;
  static late String overview;
  static late String backdrop_path;
  static late bool video;
  static late String original_title;

  static void movieModelData(MovieModel data) {
    if (data.title!.isNotEmpty) {
      title = data.title ?? "";
      vote_count = data.vote_count.toString();
      popularity = data.popularity.toString();
      vote_average = data.vote_average!.toStringAsFixed(1);
      year = data.release_date  ?? "";
      image = data.poster_path  ?? "";
      id = data.id  ?? 0;
      adult = data.adult ?? false;
      language = data.original_language  ?? "";
      overview = data.overview  ?? "";
      backdrop_path = data.backdrop_path  ?? "";
      video = data.video ?? false;
      original_title = data.original_title  ?? "";
    }
  }
}