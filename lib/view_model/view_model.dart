import 'package:films_app/data/films_model/films_model.dart';
import 'package:films_app/data/films_model/movie_model.dart';
import 'package:films_app/service/api_service.dart';
import 'package:flutter/material.dart';

import '../pages/now_playing/now_playing_page.dart';
import '../pages/popular/popular_page.dart';
import '../pages/top_rated/top_rated_page.dart';
import '../pages/upcoming/upcoming_page.dart';

class ViewModel extends ChangeNotifier {

  ViewModel() {
    print("Konstruktor ishlad");
    getData();
  }

  ApiService apiService = ApiService();

  List<MovieModel> data1 = [];
  List<MovieModel> data2 = [];
  List<MovieModel> data3 = [];
  List<MovieModel> data4 = [];

  List<String> requests = [
    "now_playing",
    "popular",
    "top_rated",
    "upcoming"
  ];

  int pageIndex = 0;
  String request = 'now_playing';
  int pageId1 = 1;
  int pageId2 = 1;
  int pageId3 = 1;
  int pageId4 = 1;
  bool isLoading = false;
  bool hasMore = true;
  String? filmKey = '';


  void getRequest() {
    request = requests[pageIndex];
    notifyListeners();
  }

  Future<void> getData({bool isLast=false}) async {
    if (isLoading || !hasMore) return;

    if (isLast) {
      isLoading = true;
      notifyListeners();
    }


    if (request == requests[0]) {
      List<FilmsModel> newFilms = await apiService.getDataFromApi(request: requests[pageIndex], page: pageId1);
      List<MovieModel> movies = newFilms[0].results!;
      print("PAGE: ${newFilms[0].page}");
      if (movies.isEmpty) {
        hasMore = false;
        notifyListeners();
      } else {
        data1.addAll(movies);
        print("Result: ${data1.length}");
        pageId1 ++;
        notifyListeners();
      }
      isLoading = false;
    } else if (request == requests[1]) {
      List<FilmsModel> newFilms = await apiService.getDataFromApi(request: requests[pageIndex], page: pageId2);
      List<MovieModel> movies = newFilms[0].results!;
      print("PAGE: ${newFilms[0].page}");
      if (movies.isEmpty) {
        hasMore = false;
      } else {
        data2.addAll(movies);
        print("Result: ${data2.length}");
        pageId2 ++;
        notifyListeners();
      }
      isLoading = false;
    } else if (request == requests[2]) {
      List<FilmsModel> newFilms = await apiService.getDataFromApi(request: requests[pageIndex], page: pageId3);
      List<MovieModel> movies = newFilms[0].results!;
      print("PAGE: ${newFilms[0].page}");
      if (movies.isEmpty) {
        hasMore = false;
        notifyListeners();
      } else {
        data3.addAll(movies);
        print("Result: ${data3.length}");
        pageId3 ++;
        notifyListeners();
      }
      isLoading = false;
    } else if (request == requests[3]) {
      List<FilmsModel> newFilms = await apiService.getDataFromApi(request: requests[pageIndex], page: pageId4);
      List<MovieModel> movies = newFilms[0].results!;
      print("PAGE: ${newFilms[0].page}");
      if (movies.isEmpty) {
        hasMore = false;
        notifyListeners();
      } else {
        data4.addAll(movies);
        print("Result: ${data4.length}");
        pageId4 ++;
        notifyListeners();
      }
      isLoading = false;
      notifyListeners();
    }
  }

  List<Widget> pages = [
    const NowPlayingPage(),
    const PopularPage(),
    const TopRatedPage(),
    const UpcomingPage()
  ];

  void getPageIndex(int index) {
    pageIndex = index;
    notifyListeners();
  }

  Widget currentPage() {
    return pages[pageIndex];
  }

  Future<void> getFilmVideo(int filmId) async {
   filmKey = await apiService.getFilmVideo(filmId);
   notifyListeners();
  }

}
