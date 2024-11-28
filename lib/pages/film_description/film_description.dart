import 'dart:ui';

import 'package:films_app/core/colors.dart';
import 'package:films_app/core/theme.dart';
import 'package:films_app/data/filtered_data.dart';
import 'package:films_app/pages/film_description/widgets/about_texts.dart';
import 'package:films_app/pages/film_description/widgets/decorated_container.dart';
import 'package:films_app/pages/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/films_model/movie_model.dart';
import '../../view_model/view_model.dart';
import '../youtube/youtube.dart';

class FilmDescription extends StatefulWidget {
  MovieModel movie;
  List<MovieModel> movies;

  FilmDescription({super.key, required this.movie, required this.movies});

  @override
  State<FilmDescription> createState() => _FilmDescriptionState();
}

class _FilmDescriptionState extends State<FilmDescription> {
  @override
  void initState() {
    if (widget.movie.title!.isNotEmpty) {
      MovieData.movieModelData(widget.movie);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
          (route) => false,
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Consumer<ViewModel>(
          builder: (context, state, child) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  collapsedHeight: 130.h,
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: const Center(
                                  child: Icon(
                                Icons.arrow_back_ios_new,
                                color: AppColors.white,
                                size: 20,
                              )))),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                      expandedTitleScale: 1.2,
                      titlePadding: EdgeInsets.only(left: 20.w),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text(
                                MovieData.title,
                                style: AppTheme.textStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )),
                              Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 20.sp,
                                    ),
                                    Text(MovieData.vote_average,
                                        style: AppTheme.textStyle(
                                            color: Colors.white,
                                            fontSize: 17.sp))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  MovieData.year.isNotEmpty
                                      ? decorated(MovieData.year)
                                      : Container(),
                                  MovieData.adult
                                      ? Container()
                                      : decorated("Adult"),
                                ],
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await state.getFilmVideo(MovieData.id);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Youtube(filmKey: state.filmKey!),
                                      ));
                                },
                                child: Container(
                                  width: 140.h,
                                  margin: EdgeInsets.only(right: 10.w),
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(colors: [
                                        AppColors.lightBlue,
                                        AppColors.blue,
                                      ]),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                      child: Text("Watch Now",
                                          style: AppTheme.textStyle(
                                              color: Colors.white,
                                              fontSize: 18))),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.h),
                        ],
                      ),
                      background: MovieData.image != ''
                          ? Image.network(
                              "https://image.tmdb.org/t/p/w500/${MovieData.image}",
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: LoadingAnimationWidget.twoRotatingArc(
                                  color: AppColors.lightBlue, size: 30))),
                  expandedHeight: 400.h,
                ),
                SliverPadding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                  sliver: SliverList.list(
                    children: [
                      Text("Overview",
                          style: AppTheme.textStyle(
                              color: Colors.white, fontSize: 20.sp)),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Text(MovieData.overview,
                          style: AppTheme.textStyle(
                              color: Colors.white, fontSize: 15.sp)),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                          child: Text("About",
                              style: AppTheme.textStyle(
                                  color: Colors.white, fontSize: 20.sp))),
                      Divider(color: AppColors.blue, thickness: 1.h),
                      Row(
                        children: [
                          about("Audio Track", MovieData.language),
                          about("Popularity", MovieData.popularity),
                        ],
                      ),
                      Row(
                        children: [
                          about("Release date", MovieData.year),
                          about("Vote count", MovieData.vote_count),
                        ],
                      ),
                      Divider(color: AppColors.blue, thickness: 1.h),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  sliver: SliverGrid.builder(
                    itemCount: widget.movies.length % 3 == 0
                        ? widget.movies.length
                        : 18,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 170.h,
                    ),
                    itemBuilder: (context, index) {
                      FilmsData.filmsModelData(index, widget.movies);
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          GestureDetector(
                              onTap: () {
                                state.data1.isEmpty
                                    ? null
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FilmDescription(
                                                  movie: widget.movies[index],
                                                  movies: widget.movies,
                                                )));
                              },
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: FilmsData.image != ''
                                      ? Image.network(
                                          "https://image.tmdb.org/t/p/w500/${FilmsData.image}",
                                          height: 130.h,
                                          width: double.maxFinite,
                                          fit: BoxFit.cover,
                                        )
                                      : Shimmer.fromColors(
                                          baseColor:
                                              AppColors.grey.withOpacity(0.5),
                                          highlightColor:
                                              Colors.white.withOpacity(0.5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.background,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            height: 150.h,
                                            // width: 200,
                                          ),
                                        ))),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20.sp,
                                ),
                                Text(FilmsData.vote_average,
                                    style: AppTheme.textStyle(
                                        color: Colors.white, fontSize: 17.sp))
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
