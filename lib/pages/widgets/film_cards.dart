import 'package:films_app/data/films_model/movie_model.dart';
import 'package:films_app/view_model/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/colors.dart';
import '../../core/theme.dart';
import '../../data/filtered_data.dart';
import '../film_description/film_description.dart';

class FilmCards extends StatefulWidget {
  List<MovieModel> data;

  FilmCards({super.key, required this.data});

  @override
  State<FilmCards> createState() => _FilmCardsState();
}

class _FilmCardsState extends State<FilmCards> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    controller.addListener(onScroll);
    super.initState();
  }

  onScroll() {
    if (controller.position.pixels >=
        controller.position.maxScrollExtent - 100) {
      context.read<ViewModel>().getData(isLast: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewModel>(
      builder: (context, state, child) {
        int itemCount = 6;
        if (widget.data.isNotEmpty) {
          itemCount = widget.data.length;
        }
        return Stack(
          children: [
            GridView.builder(
              controller: controller,
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 100.h, bottom: 120.h),
              itemCount: itemCount,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 300.h,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h),
              itemBuilder: (context, index) {
                if (widget.data.isNotEmpty) {
                  FilmsData.filmsModelData(index, widget.data);
                }
                return GestureDetector(
                    onTap: () {
                      widget.data.isEmpty
                          ? null
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FilmDescription(
                                        movie: widget.data[index],
                                    movies: widget.data,
                                      )),);
                    },
                    child: widget.data.isNotEmpty
                        ? Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.only(
                                left: 7.w, right: 7.w, top: 7.h, bottom: 7.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: FilmsData.image != ''
                                        ? Image.network(
                                            "https://image.tmdb.org/t/p/w500/${FilmsData.image}",
                                            height: 230,
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
                                                      BorderRadius.circular(
                                                          15)),
                                              height: 220.h,
                                              // width: 200,
                                            ),
                                          )),
                                SizedBox(
                                  height: 7.h,
                                ),
                                FilmsData.title.isEmpty
                                    ? Container(
                                        height: 15.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                            color:
                                                AppColors.grey.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      )
                                    : Expanded(
                                        child: Text(
                                          FilmsData.title,
                                        style: AppTheme.textStyle(
                                            fontSize: 15.sp,
                                            color: Colors.white),
                                      )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FilmsData.year.isEmpty
                                        ? Container(
                                            height: 15.h,
                                            width: 60.w,
                                            decoration: BoxDecoration(
                                                color: AppColors.grey
                                                    .withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          )
                                        : Text(FilmsData.year,
                                            style: AppTheme.textStyle(
                                                fontSize: 15.sp,
                                                color: Colors.white)),
                                    Row(
                                      children: [
                                        Text(
                                            FilmsData.vote_average.isEmpty
                                                ? "0.0"
                                                : FilmsData.vote_average,
                                            style: AppTheme.textStyle(
                                                color: AppColors.white)),
                                        SizedBox(width: 5.w),
                                        const Icon(Icons.star,
                                            color: Colors.yellowAccent,
                                            size: 20)
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        : Shimmer.fromColors(
                            baseColor: AppColors.grey.withOpacity(0.8),
                            highlightColor: AppColors.white.withOpacity(0.7),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.only(
                                  left: 7.w, right: 7.w, top: 7.h, bottom: 7.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Shimmer.fromColors(
                                        baseColor:
                                            AppColors.grey.withOpacity(0.5),
                                        highlightColor:
                                            Colors.white.withOpacity(0.5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.background,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          height: 220.h,
                                          // width: 200,
                                        ),
                                      )),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                  Container(
                                    height: 15.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        color: AppColors.grey.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 15.h,
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                            color:
                                                AppColors.grey.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      ),
                                      Row(
                                        children: [
                                          Text("0.0",
                                              style: AppTheme.textStyle(
                                                  color: AppColors.white)),
                                          SizedBox(width: 5.w),
                                          const Icon(Icons.star,
                                              color: Colors.yellowAccent,
                                              size: 20)
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ));
              },
            ),
            if (state.isLoading && widget.data.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(bottom: 60.h),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: LoadingAnimationWidget.discreteCircle(
                      color: AppColors.blue, size: 40),
                ),
              )
          ],
        );
      },
    );
  }
}
